# MCT-F26-Project1

MATLAB backend for the Webots tractor-racing controller project. The project
contains one Webots world and one MATLAB controller; no Python runtime is
required.

## Requirements

- Webots (the project was developed with R2021b)
- MATLAB with `loadlibrary` support
- On Windows, Webots and MATLAB must have the same 64-bit architecture

## Clone and run

1. Clone this repository and keep its folder structure unchanged.
2. Start Webots.
3. Select **File > Open World...** and open `worlds/automotive_new.wbt`.
4. Confirm the Tractor node has controller `main_matlab`.
5. Press Webots' **Run** button.

Webots starts MATLAB automatically and minimized. Do not run `main_matlab.m`
from MATLAB because Webots supplies the controller connection and environment.
The rendered world, console display, and speedometer display remain enabled.

## Implement the controller

Open `controllers/main_matlab/your_controller.m` in Webots' text-editor side
panel. The supplied Webots project metadata opens this file automatically.
Fill in the labeled lateral and longitudinal controller sections, save the
file, reset the simulation, and press **Run** again.

The blank template assigns safe zero values to `delta` and `F`, so the backend
can start without an undefined-variable error before a student implements the
controller. The tractor intentionally remains stationary with those defaults.

## Grade and results

When the tractor reaches the destination, the backend prints the four grading
components and total score in the Webots console. MATLAB then opens the original
4-by-2 results window with labeled axes, a white background, black text, and red
data traces. The same figure is saved beside the controller as
`controller_results.png`; this generated image is intentionally ignored by Git.

## Webots R2021b with MATLAB R2026a

That specific old/new combination has a Webots prototype-cache incompatibility.
Before the first run on such a machine, copy
`controllers/main_matlab/startup.m` to the MATLAB startup folder:

`%USERPROFILE%\Documents\MATLAB\startup.m`

The hook is inactive during normal MATLAB use. It only clears Webots R2021b's
incompatible generated prototype when MATLAB R2026 or newer is launched by
Webots. Newer compatible Webots/MATLAB combinations do not need this step.

## Important files

- `worlds/automotive_new.wbt` - rendered tractor-racing world
- `controllers/main_matlab/main_matlab.m` - Webots run loop and UI
- `controllers/main_matlab/your_controller.m` - student controller template
- `controllers/main_matlab/BaseController.m` - state estimation
- `controllers/main_matlab/evaluation.m` - project grader
- `controllers/main_matlab/buggyTrace.csv` - reference trajectory

## Differences from the supplied 2022 ZIP

- The world controller changed from `main` to `main_matlab`.
- The Python backend and cached Python bytecode were removed.
- The MATLAB speedometer asset is stored beside the MATLAB controller.
- The obsolete `old brick wall` value was normalized for Webots R2021b.
- The ZIP referenced a missing `steering_wheel.png`; the steering wheel now
  uses an equivalent dark material without an external missing texture.
