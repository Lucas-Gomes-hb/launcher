package com.example.launcher

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode


class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WALLPAPER)
        super.onCreate(savedInstanceState)
    }

    // Sem isso o Flutter renderiza numa SurfaceView opaca e tapa o wallpaper,
    // mesmo com a janela transparente e o FLAG_SHOW_WALLPAPER ativo.
    override fun getBackgroundMode(): BackgroundMode = BackgroundMode.transparent
}