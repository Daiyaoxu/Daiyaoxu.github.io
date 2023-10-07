# Simulation-of-laser-induced-interstitial-thermotherapy-LITT



![Brain-tumor-illustration-demonstrating-laser-interstitial-thermal-therapy-LITT-A](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/e3c295ef-08aa-4b85-997d-576697364d02)
Page, R. C., Ricca, G. F., &amp; Dohan, F. C. (1990). Hyperthermia for the treatment of brain tumors. Advances in Experimental Medicine and Biology, 145–153. https://doi.org/10.1007/978-1-4684-5766-7_12 

## Abstract

This is a simulation project of laser induced interstitial thermotherapy, also known as LITT. Laser-Induced Interstitial Thermotherapy (LITT) is a minimally invasive medical procedure that utilizes laser energy to generate heat, thereby treating targeted tissues. In this simulation project, we aim to model the complex interactions between laser light and biological tissues to optimize the LITT process. The project will focus on various parameters such as laser power, and exposure time, as well as tissue properties like thermal conductivity and absorption coefficients."Mainly focused on replicating the work done in the previous article 'Dosimetry and computer-based irradiation planning for laser-induced interstitial thermotherapy (LITT)'.

Our current work utilizes a two-dimensional axisymmetric model, but future iterations will incorporate three-dimensional models and asymmetric laser designs. We also plan to integrate control algorithms, including PID, LQR, and optimization controls, to adapt laser parameters in real-time for optimal treatment outcomes. Furthermore, the project will explore safety margins by simulating potential risks, such as overheating and thermal damage to adjacent tissues. Through these simulations, we aim to provide quantitative metrics for a new concept of applied laser dosage, thereby enhancing the efficacy and safety of LITT treatments.

 The internal light intensity, or interstitial fluence rate, was determined through Monte-Carlo simulations that traced the paths of individual photons. These simulations were based on the optical properties of the tissue that had been measured. To account for the spatial variations in these optical properties and to facilitate the computation of heat conduction, the area of focus was divided into cylindrical volume units, also known as voxels. Each voxel was assigned its own unique optical and thermal characteristics. The light source is configured as a cylinder with a diameter of 1.8 mm and a length of 7 mm. Light is emitted uniformly along the Z-axis of the cylinder. The radial emission angle φ ranges from 0 to 360 degrees and is randomly and uniformly distributed. The axial divergence angle is also randomly and uniformly distributed between -90 and 90 degrees. The total number of emitted photons is 200,000.
 
![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/0fb4e1a8-653d-416c-b2ec-088a906e8768)

Roggan, A., Mueller, G. J. (1994). Dosimetry and computer-based irradiation planning for laser-induced interstitial thermotherapy (LITT);. https://doi.org/10.1117/12.197569 

## The detailed calculation process is described in the PDF file, the following mainly shows the results of the computational simulation program

### Results of Monte_Carlo photon distribution calculations

![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/4ebc890a-4e07-4043-87ce-ad25bd71929d)

### Heat Source and Heat distribution (2D-coordinate system of columns)

![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/8ac808ac-162a-4969-8c82-33e64ae0155b)

###  Temperature distribution time-space

![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/3bee1a99-16ef-4db2-8fba-4680e2f96a5c)

![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/beff3957-66d6-49d2-9c5e-29637b878506)

![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT-/assets/130887176/869749aa-2d37-49e5-b104-bddb41564cc7)


## Further work
3D simulation in tissue
![image](https://github.com/Daiyaoxu/Simulation-of-laser-induced-interstitial-thermotherapy-LITT/assets/130887176/51a834c3-578c-4c89-9019-a4e1b807d69a)

