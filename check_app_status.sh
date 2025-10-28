#!/bin/bash

echo "🚀 Flutter E-Learning App Status"
echo "================================"

echo ""
echo "📱 Available Devices:"
flutter devices

echo ""
echo "🔄 Running Flutter Processes:"
ps aux | grep -E "(flutter|Runner)" | grep -v grep | head -5

echo ""
echo "📋 Instructions to View Running Apps:"
echo "===================================="
echo ""
echo "1. iOS Simulator:"
echo "   - Look for 'Simulator' app in your Applications folder"
echo "   - Or press Cmd+Space and search 'Simulator'"
echo "   - The app should be running on iPhone 16 simulator"
echo ""
echo "2. Android Emulator:"
echo "   - Look for Android Studio or Android emulator window"
echo "   - The app should be running on 'sdk gphone64 arm64'"
echo ""
echo "3. Hot Reload Commands (when app is running):"
echo "   - Press 'r' to hot reload"
echo "   - Press 'R' to hot restart"
echo "   - Press 'q' to quit"
echo ""
echo "4. To stop the apps:"
echo "   - Press Ctrl+C in the terminal where flutter run is executing"
echo "   - Or close the simulator/emulator windows"
echo ""
echo "🎯 App Features to Test:"
echo "======================="
echo "1. Authentication Screen (LinkedIn login)"
echo "2. Dark theme UI"
echo "3. Navigation between screens"
echo "4. Responsive design"
echo "5. App initialization"
echo ""
echo "📊 Build Status:"
echo "================"
if pgrep -f "flutter run" > /dev/null; then
    echo "✅ Flutter apps are building/running"
else
    echo "❌ No Flutter apps currently running"
fi

echo ""
echo "🔧 Troubleshooting:"
echo "==================="
echo "If you don't see the apps:"
echo "1. Wait a few more minutes for the build to complete"
echo "2. Check if simulators are visible in your dock"
echo "3. Run 'flutter devices' to verify devices are connected"
echo "4. Try running 'flutter run' again if needed"
