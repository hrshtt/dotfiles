# Eww Configuration

This repository contains a modular and maintainable configuration for the Eww (ElKowars wacky widgets) system.

## Directory Structure

```
.
├── bar/
│   ├── bar.yuck
│   ├── style.scss
│   ├── system-info/
│   │   ├── [component files].yuck
│   │   ├── style.scss
│   │   └── scripts/
│   └── workspace-n-titles/
│       ├── [component files].yuck
│       ├── style.scss
│       └── scripts/
├── dashboard/
│   ├── dashboard.yuck
│   ├── style.scss
│   └── [feature]/
│       ├── [component files].yuck
│       ├── style.scss
│       └── scripts/
├── eww.scss
├── eww.yuck
└── scripts/
    └── [global scripts]
```

## Configuration Overview

This Eww setup is organized into modular components, making it easy to maintain and extend.

### Main Files

- `eww.yuck`: The main configuration file that includes other Yuck files.
- `eww.scss`: The main stylesheet that imports component-specific styles.

### Components

Components are organized into directories based on their functionality:

1. `bar/`: Contains configurations for the main bar.
   - `system-info/`: System-related widgets (battery, bluetooth, wifi, etc.).
   - `workspace-n-titles/`: Workspace and window title widgets.

2. `dashboard/`: Contains configurations for the dashboard.
   - Each feature has its own subdirectory with component files and scripts.

### Styles

SCSS files are organized to match the component structure:

- Each component has its own `style.scss` file.
- Window-level `style.scss` files (e.g., `bar/style.scss`) import styles from their sub-components.
- The main `eww.scss` imports styles from window-level SCSS files.

### Scripts

Scripts are placed within their respective component directories, keeping related functionality together.

## Usage

1. Ensure Eww is installed on your system.
2. Clone this repository to your Eww configuration directory (usually `~/.config/eww/`).
3. Customize the widgets and styles as needed.
4. Run Eww with this configuration.

## Extending the Configuration

To add new components:

1. Create a new directory under the appropriate section (e.g., `bar/` or `dashboard/`).
2. Add your Yuck files for the new component.
3. Create a `style.scss` file for your component's styles.
4. Import the new component's Yuck file in the parent `main.yuck` or window-level Yuck file.
5. Import the new component's styles in the parent `style.scss` file.

## Contributing

Contributions to improve this configuration are welcome. Please submit pull requests or open issues for any bugs or feature requests.