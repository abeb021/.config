#!/bin/bash

# Arch Linux Setup Script for Hyprland Desktop Environment
# This script installs and configures the essential applications for the setup

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "This script should not be run as root"
        exit 1
    fi
}

# Function to check if running on Arch Linux
check_arch() {
    if ! grep -q "Arch Linux" /etc/os-release 2>/dev/null; then
        print_error "This script is designed for Arch Linux only"
        exit 1
    fi
}

# Function to check if yay is installed
check_yay() {
    if ! command -v yay &> /dev/null; then
        print_warning "yay (AUR helper) is not installed. Installing it first..."
        install_yay
    else
        print_success "yay is already installed"
    fi
}

# Function to install yay
install_yay() {
    print_status "Installing yay AUR helper..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
    print_success "yay installed successfully"
}

# Function to update system
update_system() {
    print_status "Updating system packages..."
    sudo pacman -Syu --noconfirm
    print_success "System updated"
}

# Function to install essential packages
install_packages() {
    print_status "Installing essential packages..."
    
    # Core packages
    local packages=(
        # Hyprland ecosystem
        "hyprland"
        "waybar"
        "hyprpaper"
        "hypridle"
        "hyprlock"
        "hyprsunset"
        
        # Terminal and launcher
        "kitty"
        "wofi"
        
        # Notifications
        "swaync"
        
        # Audio and media
        "pulsemixer"
        "playerctl"
        
        # System utilities
        "brightnessctl"
        
        # VPN
        "amneziavpn"
        
        # Essential fonts
        "ttf-jetbrains-mono-nerd"
        "ttf-font-awesome"
        "noto-fonts"
        "noto-fonts-emoji"
        
        # Additional dependencies
        "jq"
        "pulseaudio"
        "pulseaudio-alsa"
        "networkmanager"
        "wireless_tools"
        "iw"
        "wget"
        "curl"
        "git"
        "base-devel"
    )
    
    # Install packages
    for package in "${packages[@]}"; do
        print_status "Installing $package..."
        if yay -S --noconfirm "$package" 2>/dev/null; then
            print_success "$package installed"
        else
            print_warning "Failed to install $package, trying with pacman..."
            if sudo pacman -S --noconfirm "$package" 2>/dev/null; then
                print_success "$package installed via pacman"
            else
                print_error "Failed to install $package"
            fi
        fi
    done
}

# Function to check font installation
check_fonts() {
    print_status "Checking font installation..."
    
    local fonts=(
        "JetBrains Mono Nerd Font"
        "Font Awesome"
        "Noto Sans"
    )
    
    for font in "${fonts[@]}"; do
        if fc-list | grep -i "$font" > /dev/null; then
            print_success "Font '$font' is available"
        else
            print_warning "Font '$font' not found"
        fi
    done
}

# Function to enable services
enable_services() {
    print_status "Enabling system services..."
    
    # Enable NetworkManager
    sudo systemctl enable NetworkManager
    sudo systemctl start NetworkManager
    print_success "NetworkManager enabled"
    
    # Enable PulseAudio
    systemctl --user enable pulseaudio
    systemctl --user start pulseaudio
    print_success "PulseAudio enabled for user"
}

# Function to create necessary directories
create_directories() {
    print_status "Creating necessary directories..."
    
    local dirs=(
        "$HOME/.config/hypr"
        "$HOME/.config/waybar"
        "$HOME/.config/kitty"
        "$HOME/.config/wofi"
        "$HOME/.config/swaync"
        "$HOME/Pictures/Screenshots"
    )
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$dir"
        print_success "Created directory: $dir"
    done
}

# Function to set up configuration files
setup_configs() {
    print_status "Setting up configuration files..."
    
    # Check if configs already exist
    if [[ -d "$HOME/.config/hypr" && -f "$HOME/.config/hypr/hyprland.conf" ]]; then
        print_warning "Configuration files already exist. Skipping config setup."
        print_status "To update configs, please backup your current configs and run this script again."
        return
    fi
    
    print_status "Configuration files will be set up from your dotfiles repository"
    print_warning "Please ensure your dotfiles are properly cloned and configured"
}

# Function to check if applications are working
test_applications() {
    print_status "Testing installed applications..."
    
    local apps=(
        "hyprland"
        "waybar"
        "kitty"
        "wofi"
        "swaync"
        "hyprpaper"
        "hypridle"
        "hyprlock"
        "hyprsunset"
        "pulsemixer"
        "playerctl"
        "brightnessctl"
        "amneziavpn"
    )
    
    for app in "${apps[@]}"; do
        if command -v "$app" &> /dev/null; then
            print_success "$app is available"
        else
            print_error "$app is not available"
        fi
    done
}

# Function to display post-installation instructions
post_install_info() {
    print_success "Installation completed!"
    echo
    print_status "Post-installation steps:"
    echo "1. Copy your configuration files to ~/.config/"
    echo "2. Set up your wallpaper in ~/.config/hypr/hyprpaper.conf"
    echo "3. Configure your monitors in ~/.config/hypr/monitors.conf"
    echo "4. Add your user to the video group: sudo usermod -a -G video $USER"
    echo "5. Reboot or start Hyprland with: Hyprland"
    echo
    print_status "Useful commands:"
    echo "- Start Hyprland: Hyprland"
    echo "- Reload Hyprland config: hyprctl reload"
    echo "- Check system status: systemctl status"
    echo "- Check user services: systemctl --user status"
    echo
    print_warning "Make sure to configure your graphics drivers before starting Hyprland!"
}

# Main execution
main() {
    echo "=========================================="
    echo "Arch Linux Hyprland Setup Script"
    echo "=========================================="
    echo
    
    # Pre-flight checks
    check_root
    check_arch
    check_yay
    
    # Installation steps
    update_system
    install_packages
    check_fonts
    enable_services
    create_directories
    setup_configs
    test_applications
    
    # Post-installation
    post_install_info
    
    print_success "Setup completed successfully!"
}

# Run main function
main "$@"
