# GameVault (Flutter Skeleton)

A starter structure for a physical video game collection tracker.

## Quick Start
1) Create a Flutter project (stable channel recommended):
   ```bash
   flutter create gamevault
   cd gamevault
   ```

2) Replace the generated `lib/` with the `lib/` from this skeleton.
   Copy `analysis_options.yaml` and `pubspec.yaml` (merge dependencies as needed).

3) Run:
   ```bash
   flutter pub get
   flutter run
   ```

### Notes
- Uses Riverpod (or Provider swap) ready structure; minimal code avoids hard deps.
- Screens included: Home, Platform, Game Detail, Add Game Sheet, Wish List.
- Routing centralized in `routes/app_router.dart` with simple `Navigator` example.
- Theme in `core/theme/app_theme.dart` (dark-first with accent colors).
