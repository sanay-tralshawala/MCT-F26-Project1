# MCT-F26 Project 1

MATLAB backend for the Webots tractor-racing controller project. The repository
contains a Webots R2025a world, a MATLAB controller template, the reference
trajectory, and the course grader. Python is not required.

## Install the software

### 1. Install Webots R2025a

Download the R2025a installer for your operating system from the
[official Webots releases](https://github.com/cyberbotics/webots/releases/tag/R2025a),
then run the installer. On Windows, the default location is
`C:\Program Files\Webots`.

This project targets R2025a specifically. Opening and saving the world with an
older Webots release can rewrite it into an incompatible format.

### 2. Install MATLAB

Download and install a 64-bit MATLAB release through
[MathWorks Downloads](https://www.mathworks.com/downloads/). A valid MathWorks
account and MATLAB license are required. The project has been verified with
MATLAB R2026a.

On Windows, also install the
[MATLAB Support for MinGW-w64 C/C++ Compiler](https://www.mathworks.com/matlabcentral/fileexchange/52848-matlab-support-for-mingw-w64-c-c-compiler)
add-on. Webots uses MATLAB's `loadlibrary` support to load its controller and
vehicle-driver libraries.

Webots and MATLAB must use the same architecture; use 64-bit MATLAB with the
64-bit Webots installation.

### 3. Configure MATLAB in Webots

Webots normally detects the newest MATLAB installation automatically. If it
does not:

1. Open Webots.
2. Open **Tools > Preferences > General**.
3. Set the MATLAB command to the full MATLAB executable path.

On Windows, select the executable inside `bin\win64`, for example:

```text
C:\Program Files\MATLAB\R2026a\bin\win64\MATLAB.exe
```

Do not select `bin\MATLAB.exe`; Webots' R2025a documentation notes that this
launcher can interfere with controller output and process termination.

The official references are the Webots
[installation guide](https://cyberbotics.com/doc/guide/installation-procedure)
and [MATLAB controller guide](https://cyberbotics.com/doc/guide/using-matlab).

## Clone and run

1. Clone or download this repository, preserving its folder structure.
2. Start Webots R2025a.
3. Select **File > Open World...**.
4. Open `worlds/automotive_new.wbt`.
5. Confirm that `DEF Tractor Robot` uses controller `main_matlab`.
6. Press **Run**.

Webots launches MATLAB automatically and runs
`controllers/main_matlab/main_matlab.m`. Do not start that file directly from
MATLAB: Webots must establish the controller connection and environment first.

The first launch can take longer because MATLAB generates interface files for
the Webots libraries. Subsequent simulation output appears in the Webots
console.

## Implement the assignment controller

Edit only:

```text
controllers/main_matlab/your_controller.m
```

The supplied file is the student template. Implement the two labeled sections:

- Lateral control: calculate and assign steering command `delta`.
- Longitudinal control: calculate and assign force command `F`.

The template initially assigns zero to both outputs, so the project can run
safely before an implementation is added. After editing it:

1. Save `your_controller.m`.
2. Reset the simulation in Webots.
3. Press **Run** again.

Do not rename the controller folder or `main_matlab.m`; Webots identifies a
MATLAB controller by matching its controller directory and entry-point name.

## Grading and output

After the tractor reaches the destination, the grader reports:

- loop-completion score;
- average-distance score;
- maximum-distance score;
- completion-time bonus; and
- total score out of 100.

MATLAB also creates `controllers/main_matlab/controller_results.png`. Generated
result images and simulation logs are ignored by Git.

## Important files

- `worlds/automotive_new.wbt` — Webots R2025a world.
- `protos/TractorFrontWheel.proto` — R2025a-compatible front-wheel geometry.
- `protos/TractorRearWheel.proto` — R2025a-compatible rear-wheel geometry.
- `controllers/main_matlab/main_matlab.m` — simulation loop and UI.
- `controllers/main_matlab/your_controller.m` — student-editable template.
- `controllers/main_matlab/BaseController.m` — sensor access and state estimate.
- `controllers/main_matlab/evaluation.m` — grading implementation.
- `controllers/main_matlab/buggyTrace.csv` — reference trajectory.

