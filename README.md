#  Controllable Heliotrope Video
 
The goal of this practical is to combine Direct Manipulation with the ideas in VideoTextures. This is a system that allows the user to (seemingly) specify the look-at directions of a "real" human face.

![FaceImg](https://github.com/pleaseRedo/Controllable-Heliotrope-Video/blob/master/Heliotrope/gabriel.jpg)


The end-user input to the system is a piecewise linear curve. This curve specifies the linear sections of the path that the video-sprite object should follow. For the default data provided here, the path should specify a sequence of look-at-points of the face.
Your system will follow that user-specified path to traverse a collection of images (could also be video) where the subject was excercising at least two obvious degrees of freedom. The resulting video should be smooth in terms of looking as continuous as possible, and controlled in terms of moving in accordance with the user's directions. In theory, and NOT a required part of this assignment, one could imagine a real-time version of the system, where the human face would turn interactively, in response to click-and-drag mouse inputs.

* I use the graph based approach by converting a distance matrix into a graph, where nodes represent images, and edges connect pairs of images whose appearance-distance is small
* For each node in the graph, compute the shortest path to the image I where point s was defined. 
* Compute the advected location of point s in every other node, using optical flow. 
* Pick the path in Paths whose advected location comes closest to the point 

# Result:

![resultanimation](https://github.com/pleaseRedo/Controllable-Heliotrope-Video/blob/master/Heliotrope/result.gif)


## Self-captured dataset 
I also provided a dataset under an ideal light condition, good for debugging.
It is an iron made lens cap on a non-reflectable matte in different locations.
![resultanimation](https://github.com/pleaseRedo/Controllable-Heliotrope-Video/blob/master/4.jpg)

