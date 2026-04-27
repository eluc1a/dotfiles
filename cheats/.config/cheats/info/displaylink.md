# DisplayLink Mouse Lag Fix (macOS Tahoe 26 + M3 Max)

## What worked

```bash
defaults write -g NSAutoFillHeuristicControllerEnabled -bool false
sudo rm -rf /Library/Caches/com.apple.Metal/
sudo killall WindowServer
```

Then **reboot**.

## To undo

```bash
defaults delete -g NSAutoFillHeuristicControllerEnabled
```

## Context

- Root cause: Tahoe bug in `NSAutoFillHeuristicController` spikes CPU and builds input lag over time
- Compounded by Electron apps (VS Code, Slack, Discord, Spotify) overloading WindowServer
- DisplayLink Manager 15.1 required
- Reduce Transparency should be ON (Accessibility → Display)
