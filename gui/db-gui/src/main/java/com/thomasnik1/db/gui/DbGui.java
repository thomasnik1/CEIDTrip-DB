package com.github.thomasnik1.db.gui; // Your actual package name here

import com.github.thomasnik1.db.gui.MainDashboard; // Imports your GUI

public class DbGui {
    public static void main(String[] args) {
        
        // This tells Java to open your MainDashboard window and make it visible
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainDashboard().setVisible(true);
            }
        });
        
    }
}
