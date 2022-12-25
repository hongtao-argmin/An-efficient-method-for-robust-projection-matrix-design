# An efficient method for robust projection matrix design

In this paper, we propose an effficient method to design the projection matrix when the signal cannot be exactly represented by a given dictionary. Moreover, the proposed model is a signal independ model. So we extend the design of projection matrix on a high dimensional dictionary. The simulation results show that we can improve the signal recovery accuracy a lot on such a case. 

Paper Link: https://arxiv.org/abs/1609.08281

To run these codes, please download all of the codes and the corresponding necessary external toolboxes. Note that do not forget to add their path in your own matlab path. 

Two toolboxes named omp and ksvd are needed to run this toolbox which can be download from http://www.cs.technion.ac.il/~ronrubin/software.html.

The optimization toolbox named minFunc can be found in https://www.cs.ubc.ca/~schmidtm/Software/minFunc.html.

The online algorithm shown in 
J. Mairal, F. Bach, J. Ponce, and G. Sapiro, ``Online dictionary learning for sparse coding,’’  Proceedings of the 26th annual international conference on machine learning. ACM, 2009 can be download from http://spams-devel.gforge.inria.fr/.  
 
In our case, we also redo this algorithm which is named ` Online_DIC_MBPS09.m’.  

The file named ‘Experiment A.m’, ‘Experiment  B.m’and ‘Experiment C.m’ are used to redo the corresponding experiments mentioned in the paper. 
The main algorithm in this paper is named ‘Robust_project_matrix.m’.

Remark:
The traindata and testdata should be stored as X and X_test.

To obtain how to utilize the related functions in this toolbox, just use `help function_name’.


If you find any bugs in this toolbox, feel free to contact the author Tao Hong through email: hongtao@cs.technion.ac.il.   

https://hongtao-argmin.github.io
