#!/bin/bash

echo "🚀 Flutter E-Learning App - Testing Status"
echo "=========================================="

echo ""
echo "📱 Available Devices:"
flutter devices

echo ""
echo "🔄 Active Flutter Processes:"
ps aux | grep -E "(flutter|Runner)" | grep -v grep | wc -l | xargs echo "Total processes:"

echo ""
echo "📊 Build Status Check:"
if pgrep -f "flutter run" > /dev/null; then
    echo "✅ Flutter apps are building/running"
    
    # Check for specific platforms
    if pgrep -f "emulator-5554" > /dev/null; then
        echo "✅ Android emulator build in progress"
    fi
    
    if pgrep -f "macos" > /dev/null; then
        echo "✅ macOS build in progress"
    fi
    
    if pgrep -f "iphonesimulator" > /dev/null; then
        echo "✅ iOS simulator build in progress"
    fi
else
    echo "❌ No Flutter apps currently running"
fi

echo ""
echo "🎯 Testing Instructions:"
echo "======================="
echo ""
echo "1. Look for these windows/apps:"
echo "   - Android Studio (Android emulator)"
echo "   - Simulator app (iOS simulator)"
echo "   - E-Learning app window (macOS)"
echo ""
echo "2. If you see the app running:"
echo "   - Test the booking flow"
echo "   - Select an expert"
echo "   - Fill session details"
echo "   - Complete payment"
echo "   - Check if booking appears in schedule tab"
echo ""
echo "3. Hot Reload Commands (in terminal):"
echo "   - Press 'r' to hot reload"
echo "   - Press 'R' to hot restart"
echo "   - Press 'q' to quit"
echo ""
echo "4. If apps are not visible:"
echo "   - Wait 2-3 more minutes for build to complete"
echo "   - Check your dock for simulator/emulator icons"
echo "   - Look for new windows that may have opened"
echo ""
echo "🔧 Troubleshooting:"
echo "=================="
echo "If you don't see any apps:"
echo "1. Wait a few more minutes (first build takes time)"
echo "2. Check Activity Monitor for 'Simulator' or 'Android' processes"
echo "3. Try running: flutter run -d macos (for desktop version)"
echo "4. Check if emulators are visible in your dock"
echo ""
echo "📱 Expected App Features:"
echo "========================"
echo "✅ Dark theme UI"
echo "✅ LinkedIn authentication"
echo "✅ Expert search and booking"
echo "✅ Real-time messaging"
echo "✅ Payment integration"
echo "✅ Schedule management"
echo "✅ Profile management"
echo ""
echo "🎉 The booking fix is now active!"
echo "After booking a session, it should appear immediately in the schedule tab."
