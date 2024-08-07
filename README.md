# Ball and Beam Balance Control System

## Project Overview

The objective of this project is to stabilize and control the position of a ball on a beam. This involves designing a suitable controller and model for the system. The project includes plant modeling, DC motor modeling, controller design, and testing both in Simulink and on hardware.

https://github.com/ameer-alwadiya/Ball-and-Beam-Balance-Control-System/assets/127532790/c3fe885b-00c9-4214-ae2b-99b8005e0620
<!-- Continue with the rest of your README content -->

## Files Included

- `DERIVE_TF_DC_MOTOR.m`: MATLAB script for deriving the transfer function of the DC motor.
- `PWM_last.slx`: Simulink model for the PWM control system.
- `Project_description.pdf`: Detailed description of the project.
- `data.mat`: Data file used in the project.
- `wave_data.txt`: Text file with wave data.
- `README.md`: This file.

## Getting Started

### Prerequisites

- MATLAB (including Simulink) with Control System Toolbox.
- MATLAB scripts and Simulink models provided in this repository.

### Running the Code

1. **Set Up Your MATLAB Environment**
   - Ensure MATLAB is installed and properly configured on your system.

2. **Load the Data**
   - Make sure the `data.mat` and `wave_data.txt` files are in the current working directory or specify the correct path in the scripts.

3. **Run the Plant Modeling Script**
   - Open MATLAB.
   - Load and run the `DERIVE_TF_DC_MOTOR.m` script to derive the transfer function and state-space model of the plant.

     ```matlab
     run('DERIVE_TF_DC_MOTOR.m');
     ```

4. **Open the Simulink Model**
   - Open the `PWM_last.slx` Simulink model using MATLAB:

     ```matlab
     open_system('PWM_last.slx');
     ```

   - Run the simulation by clicking the "Run" button in the Simulink model window.

5. **Testing and Validation**
   - Test the controller design in Simulink by running simulations and verifying the results.

6. **Testing on Hardware**
   - For hardware testing, refer to the hardware setup instructions provided in the `Project_description.pdf`. Ensure that all necessary hardware components are connected as described.

## Results and Further Developments

- Estimation of nonlinear dynamics to address oscillation issues.
- Installation of a second sensor (e.g., ultrasonic sensor) for improved ball position measurement.
- Further development of the Simulink model and integration with ongoing research.
- Implementation of prediction methods for ball position under uncertainty, such as using a Kalman filter.

## Questions?

If you have any questions or need further assistance, please contact the author at ameer.alwadiya@outlook.com.

## Acknowledgements

Thank you for using this project. We hope it helps you in your research and development efforts.


