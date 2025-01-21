# Auto Input Device Fix for macOS

I created this script because I was frustrated with macOS constantly changing my input device every time I connected my Bluetooth headset. I had to manually set my preferred microphone every single time, and it became a nuisance. 

This script ensures that your preferred input device (e.g., a dedicated microphone) remains selected on macOS, even when new devices (like Bluetooth headsets) are connected. By default, macOS automatically switches input devices when a new audio device is connected, which can disrupt workflows. This script continuously monitors the active input device and switches it back to your preferred microphone if it changes.

---

## Features

- Automatically sets your preferred input device when it is changed.
- Runs continuously in the background to ensure consistent audio input.
- Works seamlessly with macOS and SwitchAudioSource.

---

## Prerequisites

Before using the script, make sure you have the following:

1. **Homebrew** installed. If not, install it by running:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. **SwitchAudioSource** installed via Homebrew:
   ```bash
   brew install switchaudio-osx
   ```

## Installation

1.	Clone this repository:
    ```bash
    git clone git@github.com:matheusrrocha/input-device-switcher.git
    cd autoinput-device-switcher
    ```
2.	Make the script executable:
    ```bash
    chmod +x fix_input_device.sh
    ```
3. You can find the exact name of your devices by running:
    ```bash
    SwitchAudioSource -t input -a
    ```
4. Run the script:
    ```bash
    ./fix_input_device.sh "my Device Name"
    ```

## Optionally, set the script to run automatically at login:

1. Open the Automator app on macOS.
2. Create a new Application.
3. Add the action Run Shell Script and paste the command:
    ```
    /path/to/fix_input_device.sh
    ```
4. Save the application and add it to System Settings > Users & Groups > Login Items.


## Notes

1. Ensure that SwitchAudioSource is installed and accessible in your $PATH.
2. You can customize the monitoring interval by modifying the sleep duration in the script.

## Troubleshooting

If you encounter SwitchAudioSource: command not found, ensure that Homebrew is installed and the SwitchAudioSource binary is accessible. Add Homebrew’s binary directory to your PATH:
 
   
