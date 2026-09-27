{ ... }:

{
    programs.vesktop = {
        enable = true;

        settings = {
            discordBranch = "stable";
            checkUpdates = false;
            minimizeToTray = false;
            arRPC = true;
            splashColor = "rgb(205, 214, 244)";
            splashBackground = "rgb(17, 17, 27)";
            spellCheckLanguages = [
                "en-US"
                "en"
            ];
        };

        vencord.settings = {
            autoUpdate = false;
            autoUpdateNotification = false;
            notifyAboutUpdates = false;
            useQuickCss = true;
            themeLinks = [
                "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
            ];
            plugins = {
                CrashHandler = {
                    enabled = true;
                };
                FakeNitro = {
                    enabled = true;
                    enableStickerBypass = true;
                    enableStreamQualityBypass = true;
                    enableEmojiBypass = true;
                    transformEmojis = true;
                    transformStickers = true;
                    transformCompundSentence = false;
                };
                FixImagesQuality = {
                    enabled = true;
                    originalImagesInChat = false;
                };
                IrcColors = {
                    enabled = true;
                    memberListColors = true;
                    lightness = 70;
                    applyColorOnlyInDms = false;
                    applyColorOnlyToUsersWithoutcolor = false;
                };
                MessageLogger = {
                    enabled = true;
                    collapseDeleted = false;
                    deleteStyle = "text";
                    ignoreBots = false;
                    ignoreSelf = false;
                    ignoreUsers = "";
                    ignoreChannels = "";
                    ignoreGuilds = "";
                    logEdits = true;
                    logDeletes = true;
                    inlineEdits = true;
                };
                PlatformIndicators = {
                    enabled = true;
                    colorMobileIndicator = true;
                    list = true;
                    badges = true;
                    messages = true;
                };
                ShikiCodeblocks = {
                    enabled = true;
                    useDevIcon = "GREYSCALE";
                    theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/2d87559c7601a928b9f7e0f0dda243d2fb6d4499/packages/tm-themes/themes/dark-plus.json";
                };
                ShowMeYourName = {
                    enabled = true;
                    mode = "nick-user";
                    friendNicknames = "dms";
                    displayNames = false;
                    inReplies = false;
                };
                SpotifyCrack = {
                    enabled = true;
                    noSpotifyAutoPause = true;
                    keepSpotifyActivityOnIdle = false;
                };
                TenorGifSearch = {
                    enabled = true;
                };
                TypingTweaks = {
                    enabled = true;
                    alternativeFormatting = true;
                };
                Unindent = {
                    enabled = true;
                };
                USRBG = {
                    enabled = true;
                    voiceBackground = true;
                };
                VoiceChatDoubleClick = {
                    enabled = true;
                };
                VoiceMessages = {
                    enabled = true;
                };
                VolumeBooster = {
                    enabled = true;
                    multiplier = 2;
                };
                WebKeybinds = {
                    enabled = true;
                    showNavigationButtons = true;
                    overrideCommonKeybinds = true;
                };
                WebScreenShareFixes = {
                    enabled = true;
                };
                YoutubeAdblock = {
                    enabled = true;
                };

                # Required plugins
                ConcatenatedComponentExtractor = {
                    enabled = true;
                };
                DisableDeepLinks = {
                    enabled = true;
                };
                NoTrack = {
                    enabled = true;
                    disableAnalytics = true;
                };
                Settings = {
                    enabled = true;
                    settingsLocation = "aboveNitro";
                    includeVencordInfoWhenCopying = true;
                };
                SupportHelper = {
                    enabled = true;
                };
                WebContextMenus = {
                    enabled = true;
                };
            };
        };
    };
}