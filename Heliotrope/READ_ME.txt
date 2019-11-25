TO RUN THE CODE, PLEASE FOLLOW:

#################NOTE BEFORE RUNNING##################
Before running the code, make sure to have the optical flow file flows.mat placed at the directory.  
Otherwise, the program will compute flow for itself but takes very long time.


1. Run 'Basic.m'

2. Follow the promp to choose the data (Type 1 or 0)

3. Follow the promp to choose enabling advanced part 1 (Type 1 or 0)

3. Typing in numbers to specify the source image. 

4. Typing in numbers to specify the number of points to draw.


6.1 Using mouse click to choose the eye's look at direction, the first click is preferred to be at the centre of iris.
Hit enter to confirm.(Provided data)

6.2 Using mouse click to choose the cap's movement direction, the first click is preferred to be at the centre of cap.
Hit enter to confirm.(Provided data)

7. You will see the choosen path as well as the estimated path presented to you.

8. Output images are saved as <./result.gif>

9. Extract frames for the gif if you wish to inspect result frame by frame. (e.g using photoshop/ or 'http://gifgifs.com/split/')








FOLDERS:
gjbLookAtTargets:
A folder contains the provided frames.

output: 
A folder contains the result for examination.

ownData:
A folder contains my own image, which is the 2nd advanced part.


Output folder break down:
output_advanced_provided:
Contains the user input path , system estimated path and an image sequence which is the output.
These files are gathered using the advanced part 1 method and provided data.

output_basic_provided
Contains the user input path , system estimated path and an image sequence which is the output.
These files are gathered using the basic part and provided data.

output_basic_own
Contains the user input path , system estimated path and an image sequence which is the output.
These files are gathered using the basic part and my own data.