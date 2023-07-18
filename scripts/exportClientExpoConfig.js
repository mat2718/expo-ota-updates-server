const ExpoConfig = require('@expo/config');
const path = require('path');

const projectDir = path.join('C:/Users/MATTH/OneDrive/Documents/GitHub/custom-expo-updates-server');

const { exp } = ExpoConfig.getConfig(projectDir, {
  skipSDKVersionRequirement: true,
  isPublicConfig: true,
});

console.log(JSON.stringify(exp));
