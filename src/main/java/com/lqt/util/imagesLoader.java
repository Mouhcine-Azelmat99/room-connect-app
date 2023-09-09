package com.lqt.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class imagesLoader {
    public static List<String> loadAvatars() {
        List<String> avatars = new ArrayList<>();
        String avatarFolderPath = "C:\\Users\\mohamed4\\Desktop\\fiiver customor\\roomConnectMohcine\\room-connect-app\\src\\main\\webapp\\resources\\img\\avatar";
        File folder = new File(avatarFolderPath);
        File[] files = folder.listFiles();

        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    avatars.add(file.getName());
                }
            }
        }

        List<String> randomAvatars = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            int randomIndex = (int) (Math.random() * avatars.size());
            randomAvatars.add(avatars.get(randomIndex));
        }
        return randomAvatars;
    }

}
