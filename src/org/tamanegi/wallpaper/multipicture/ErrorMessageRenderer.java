package org.tamanegi.wallpaper.multipicture;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;

public class ErrorMessageRenderer {
    
    private Paint textPaint;
    private Paint backgroundPaint;
    private Context context;
    
    public ErrorMessageRenderer(Context context) {
        this.context = context;
        initPaints();
    }
    
    private void initPaints() {
        textPaint = new Paint();
        textPaint.setColor(Color.WHITE);
        textPaint.setTextSize(48);
        textPaint.setAntiAlias(true);
        textPaint.setTextAlign(Paint.Align.CENTER);
        
        backgroundPaint = new Paint();
        backgroundPaint.setColor(Color.BLACK);
    }
    
    public void drawPermissionError(Canvas canvas, int width, int height) {
        String[] lines = {
            "Pictures Unavailable",
            "",
            "Storage permission required",
            "",
            "Please grant storage permission",
            "in Settings > Apps > MultiPicture",
            "> Permissions > Storage",
            "",
            "Or restart the wallpaper"
        };
        
        drawErrorMessage(canvas, width, height, lines);
    }
    
    public void drawNoImagesError(Canvas canvas, int width, int height) {
        String[] lines = {
            "No Pictures Found",
            "",
            "Please check:",
            "• Storage permission granted",
            "• Pictures exist in selected folder/album",
            "• Try restarting the wallpaper"
        };
        
        drawErrorMessage(canvas, width, height, lines);
    }
    
    private void drawErrorMessage(Canvas canvas, int width, int height, String[] lines) {
        // Clear background
        canvas.drawRect(0, 0, width, height, backgroundPaint);
        
        // Calculate starting position
        float lineHeight = textPaint.getTextSize() * 1.5f;
        float totalHeight = lines.length * lineHeight;
        float startY = (height - totalHeight) / 2 + textPaint.getTextSize();
        
        // Draw each line
        for (int i = 0; i < lines.length; i++) {
            if (!lines[i].isEmpty()) {
                canvas.drawText(lines[i], width / 2, startY + (i * lineHeight), textPaint);
            }
        }
    }
    
    public void drawSetupInstructions(Canvas canvas, int width, int height) {
        String[] lines = {
            "MultiPicture Live Wallpaper",
            "",
            "Setup Required:",
            "",
            "1. Grant storage permission",
            "2. Select picture source",
            "3. Choose pictures/folders",
            "",
            "Go to Settings to configure"
        };
        
        drawErrorMessage(canvas, width, height, lines);
    }
}