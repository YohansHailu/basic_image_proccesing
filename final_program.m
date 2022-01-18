clear;clc

%% image preview part
function graphics()

    global mainFrame;
    mainFrame = figure("position",[100 100  400 500])


    global imgFrame;
    imgFrame = axes("parent",mainFrame,...
                    "position",[0 0.1 0.7 1],...
                    "xtick",[],"ytick",[],...
                    "xlim",[0 1],"ylim",[0 1],...
                    "color",[.92 .9 1])

    %%% open button
   b1 = uicontrol(mainFrame,"style","pushbutton",...
              "string","open Image",...
             "position",[10 10 200 50],...
              "callback",@openImg)
    %%%save button
   uicontrol(mainFrame,"style","pushbutton","string","saveImage" ...
                            ,"position",[220 10 200 50]...
                      ,"callback",@saveImg)


      %%% apply button 
   uicontrol( mainFrame, "style","pushbutton",
                      "string","apply",...
                      "units","normalized",...
                      "position",[0.72, 0  .28 .1],...

                      "callback",@apply)

      %%sets of controlers for edithing on the left

   global slide_h=[];
   global slide_value=[];
   global slide_t=[ cellstr("brightness") "contrast" "blure" "edge detection"  "red" "green" "blue"];

   horiD = 0.72;verD=.9;wid=.28;hig=.1;
   for i=[0:6]
       
       slide_value(i+1)=uicontrol( mainFrame, "style","edit",...
                                "string",[slide_t(i+1) "0%"],...
                               "units","normalized",...
                               "position",[horiD verD-i*hig wid hig],...
                               "callback",@edit);
       slide_h(i+1)=uicontrol( mainFrame, "style","slider",...
                               "string",".brightness",...
                               "units","normalized",...
                               "value",.5,...
                               "position",[horiD verD-i*hig wid hig],...
                               "callback",@edit);
    end


end







% plots image
function plotImage(image)
   global imgFrame;
   axes(imgFrame);
   imshow(image,[]);
end



% opening image to be ploted
function openImg()

   [fname,fpath] = uigetfile();
   global orgImage;%  orginal emage global so can be acces by all
   orgImage = imread(fullfile(fpath,fname));
   plotImage(orgImage);
   global edit_history;
   edit_history={(orgImage)};

   global  slide_h;
   global  slide_t;
   global slide_value;
   for i=slide_h
      set(i,"value",.5);
   end
   j=0;
   for i=slide_value
     j=j+1;
     set(i,"string",[slide_t(j) "0%"])
    end
end

% writing finale image to disk
function saveImg(image)
   global edit_history;

   imwrite(edit_history{end},uiputfile());
end



function edit()

  global slide_h;
  global slide_t;
  global slide_value;
  global orgImage;

  global edit_history;
  global edited_image;
  n_value = get(gco(),"value")
  str_value = [num2str(n_value*100-50,2) "%" ]
  t_value = 2*n_value-1;
  switch(gco())

    %%% brightness
    case slide_h(1)
      disp(slide_t(1))



      set(slide_value(1),"string",[slide_t(1) str_value])

      edited_image = edit_history{1,end}+t_value*150;

    %%% contrast
    case slide_h(2)
      disp(slide_t(2))

      c_value = 2*n_value-1;
      set(slide_value(2),"string",[slide_t(2) str_value])

      edited_image = edit_history{end}*c_value*2;

   %% blure
    case slide_h(3)
      disp(slide_t(3))
      set(slide_value(3),"string",[slide_t(3) str_value])


      edited_image = edit_history{end};
      b_value = abs(n_value-0.5)*30;
      b_value  = int64(b_value);

      disp("convlutin number")
      b_value

      psf = ones(b_value,b_value);
      psf = psf./sum(sum(psf));
      for i=1:3
          edited_image(:,:,i) = conv2(edited_image(:,:,i),psf,"same");
      end

   %%edge detection
   case slide_h(4)
      disp(slide_t(4));
      set(slide_value(4),"string",[slide_t(4) str_value]);
      psf = -1*ones(3,3)/8*n_value;
      psf(2,2) = 1;


      edited_image = (edit_history{end}(:,:,1));
      edited_image=conv2(edited_image,psf,"same");

   %%red
   case slide_h(5)
       disp(slide_t(5))
      set(slide_value(5),"string",[slide_t(5) str_value])

      edited_image = edit_history{end};
      edited_image(:,:,1) = edit_history{end}(:,:,1)*t_value*2;

   %%green
   case slide_h(6)
       disp(slide_t(6))
      set(slide_value(6),"string",[slide_t(6) [num2str( (2*n_value-1)*100,2) "%" ]] )

      edited_image = edit_history{end};
      edited_image(:,:,2) = edit_history{end}(:,:,2)*t_value*2;
   %%blue
   case slide_h(7)
      disp(slide_t(7))
      set(slide_value(7),"string",[slide_t(7) [num2str( (2*n_value-1)*100,2) "%" ]] )


      edited_image = edit_history{end};
      edited_image(:,:,3) = edit_history{end}(:,:,3)*t_value*2;






  end




        imshow([0]);
        imshow(edited_image);

end

function apply()
   global edit_history;
   global edited_image;

   edit_history{end+1} = edited_image;

   end



graphics()
