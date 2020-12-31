{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE TypeApplications  #-}
{-# OPTIONS_GHC -Wall          #-}
module Main where
{- {{{ -}
import           RIO
import           System.Process
import           System.IO.Unsafe               ( unsafePerformIO )
import           System.IO                      ( hPutStrLn )

import           XMonad
import           XMonad.Hooks.EwmhDesktops      ( ewmh )
import           XMonad.Hooks.DynamicLog        ( PP(..)
                                                , xmobarPP
                                                -- , xmobar
                                                , dynamicLogWithPP
                                                )
import           XMonad.Hooks.ManageDocks       ( AvoidStruts
                                                , manageDocks
                                                , docks
                                                , avoidStruts
                                                , ToggleStruts(..)
                                                )
import qualified XMonad.StackSet                as W
import           XMonad.Util.EZConfig           ( additionalKeys
                                                , additionalKeysP
                                                , removeKeysP
                                                )
import           XMonad.Layout.Decoration       ( Decoration
                                                , DefaultShrinker
                                                )
import           XMonad.Layout.LayoutModifier   ( ModifiedLayout )
import           XMonad.Layout.Simplest         ( Simplest )
import           XMonad.Layout.ComboP           ( CombineTwoP
                                                , SwapWindow(..)
                                                , Property(..)
                                                , combineTwoP
                                                )
import           XMonad.Layout.TwoPane          ( TwoPane(..) )
import           XMonad.Layout.Tabbed            --( TabbedDecoration
                                                 --, simpleTabbed
                                                 --, simpleTabbedBottom
                                                 --)
import           XMonad.Util.Run                ( safeSpawn
                                                , spawnPipe
                                                , runProcessWithInput
                                                )
import           Graphics.X11.Xinerama          as X
import           Graphics.X11.Xlib.Display      as X
{- }}} -}
main :: IO ()
main = xmonad =<< xmobar' (ewmh myConfig)
  where
    myConfig = def
      { modMask            = mod4Mask
      , terminal           = "gnome-terminal"
      , workspaces         = myWorkspaces
      , focusedBorderColor = "#00bfff"
      -- , focusedBorderColor = "#000000"
      , normalBorderColor  = "#eeeeee"
      , manageHook         = manageDocks <+> manageHook def
      --, logHook            = myLogHook
      , layoutHook         = myLayoutHook
      , startupHook        = mapM_ spawn [ "dropbox start"
                                         , "unity-settings-daemon"
                                         , "compton -CG --active-opacity 1.0 --shadow-ignore-shaped"
                                         , "feh --bg-scale $HOME/Dropbox/WallPapers/Reflexion.jpg"
                                         -- , "feh --bg-scale $HOME/Dropbox/WallPapers/PrincessPrincipalOST-screen.jpg"
                                         , "xmodmap $HOME/.Xmodmap"
                                         ]
      , handleExtraArgs    = \xs conf -> do
          rs <- X.getScreenInfo =<< X.openDisplay ""
          mborder <- tryAnyDeep $ read <$> readFile "/tmp/xmonad_borderwidth"
          let borderWidth = case mborder of
                Right x -> x
                Left _
                  | atHome    -> 20
                  | otherwise -> 10
              atHome = rs == [ Rectangle 0 0   1280 720
                             , Rectangle 0 720 1920 1080 ]
              conf'  = conf {  borderWidth }
          -- appendFile "/tmp/hoge" (show mborder)
          handleExtraArgs def xs conf'
      }

      `additionalKeysP`
      [ ("M-g"          , spawn "google-chrome")
      , ("M-p"          , spawn "ulauncher")
      , ("M-S-q"        , kill)
      , ("M-S-C-q"      , io exitSuccess)
      , ("M-x"          , spawn "sudo pm-suspend")
      , ("M-S-x"        , spawn "systemctl suspend")
      , ("M-<Return>"   , forcusNextScreen)
      , ("M-C-<Return>" , shiftNextScreen)
      , ("M-s"          , swapScreen)
      , ("M-a"          , sendMessage SwapWindow)
      , ("M-S-a"        , hoge) -- なんか動作の確認に
      -- , ("M-S-d"        , killXmobar)
      , ("M-S-r"        , recompile False >> restart "xmonad" True)
      , ("M-S-k"        , spawn "amixer -D pulse sset Master 2%+")
      , ("M-S-j"        , spawn "amixer -D pulse sset Master 2%-")
      , ("M-S-o"        , spawn "amixer -D pulse sset Master mute")
      , ("M-S-t"        , spawn "amixer -D pulse sset Master toggle")
      , ("M-S-s"        , spawn $ unwords ["scrot ", screenShotName])
      , ("M-m"          , toggleTouchPad)
      , ("M-b"          , sendMessage ToggleStruts) -- xmobar
      ]

      `additionalKeysP`
      [ ("<XF86AudioRaiseVolume>"  , spawn "amixer -D pulse sset Master 2%+")
      , ("<XF86AudioLowerVolume>"  , spawn "amixer -D pulse sset Master 2%-")
      , ("<XF86AudioMute>"         , spawn "amixer -D pulse sset Master 0%" )
      , ("M-<XF86AudioRaiseVolume>", spawn "xbacklight -inc 10")
      , ("M-<XF86AudioLowerVolume>", spawn "xbacklight -dec 10")
      ]

      `additionalKeys`
      [((m .|. mod4Mask, k), windows $ f i)
      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

      `removeKeysP`
      [ "S-C-n" ]

      --`additionalKeysP`
      --[ ("M-<Right>", sendMessage $ Move R)
      --, ("M-<Left>" , sendMessage $ Move L)
      --, ("M-<Up>"   , sendMessage $ Move U)
      --, ("M-<Down>" , sendMessage $ Move D)
      --]
      --`additionalKeys`
      --[ ((mod4Mask, xK_Right), sendMessage $ Move R)
      --, ((mod4Mask, xK_Left ), sendMessage $ Move L)
      --, ((mod4Mask, xK_Up   ), sendMessage $ Move U)
      --, ((mod4Mask, xK_Down ), sendMessage $ Move D)
      --]
      --`additionalKeys`
      --[ ((mod4Mask .|. controlMask, xK_Right), sendMessage $ Swap R)
      --, ((mod4Mask .|. controlMask, xK_Left ), sendMessage $ Swap L)
      --, ((mod4Mask .|. controlMask, xK_Up   ), sendMessage $ Swap U)
      --, ((mod4Mask .|. controlMask, xK_Down ), sendMessage $ Swap D)
      --]
      --`additionalKeys`
      --[ ((mod4Mask .|. controlMask .|. shiftMask, xK_Right), sendMessage $ Go R)
      --, ((mod4Mask .|. controlMask .|. shiftMask, xK_Left ), sendMessage $ Go L)
      --, ((mod4Mask .|. controlMask .|. shiftMask, xK_Up   ), sendMessage $ Go U)
      --, ((mod4Mask .|. controlMask .|. shiftMask, xK_Down ), sendMessage $ Go D)
      --]

    screenShotName :: String
    screenShotName = "$HOME/Dropbox/ScreenShots/Screenshot%Y-%m-%d-%H-%M-%S.png"

    myWorkspaces :: [String]
    myWorkspaces = map show [1..9 :: Int]


-------------------------------------------------------------------------------
-- Command
-------------------------------------------------------------------------------

withNextScreen :: (WorkspaceId -> WindowSet -> WindowSet) -> X ()
withNextScreen func = gets (W.visible . windowset) >>= \case
    [] -> return ()
    next : _ -> windows $ func $ W.tag $ W.workspace next

forcusNextScreen :: X ()
forcusNextScreen = withNextScreen W.view

shiftNextScreen :: X ()
shiftNextScreen = withNextScreen W.shift

swapScreen :: X ()
swapScreen = windows $ \stack -> case W.visible stack of
    [] -> stack
    x : rest -> stack { W.current = y { W.workspace = W.workspace x }
                      , W.visible = x { W.workspace = W.workspace y } : rest
                      }
                  where y = W.current stack

setTouchPad :: Bool -> X ()
setTouchPad b =
    safeSpawn "gsettings"
      [ "set"
      , "org.gnome.desktop.peripherals.touchpad"
      , "send-events"
      , if b then "enabled" else "disabled"
      ]

isTouchPadEnabled :: X Bool
isTouchPadEnabled = do
    out <- runProcessWithInput "gsettings"
              ["get"
              , "org.gnome.desktop.peripherals.touchpad"
              , "send-events"
              ]
              ""
    case out of
      "'enabled'\n"  -> return True
      "'disabled'\n" -> return False
      _ -> error' $ "toggleTouchPad: unknown input: " <> show out
  where
    error' s = log' s >> error s

toggleTouchPad :: X ()
toggleTouchPad = setTouchPad . not =<< isTouchPadEnabled

-- touchpad=$(gsettings list-schemas | grep touchpad)
-- gsettings list-keys $touchpad
-- gsettings range $touchpad some-key

-------------------------------------------------------------------------------
-- xmobar
-------------------------------------------------------------------------------

-- xmobarにLayout名を表示しない
xmobar' :: LayoutClass l Window
        => XConfig l -> IO (XConfig (ModifiedLayout AvoidStruts l))
xmobar' conf = do
    h <- spawnPipe "$HOME/.xmonad/xmobar"
    return $ docks $ conf
        { layoutHook = avoidStruts (layoutHook conf)
        , logHook = logHook conf
                 <> dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn h
                      , ppLayout = const ""
                      }
        }

-------------------------------------------------------------------------------
-- LogHook
-------------------------------------------------------------------------------

myLogHook :: X ()
myLogHook = do
    oldScreenNum <- getScreenNum
    screenNum <- gets (windowset >>> W.visible >>> length >>> (+1))
    when (oldScreenNum /= screenNum) $ do
      setScreenNum screenNum
      restartXmobar

restartXmobar :: X ()
restartXmobar = undefined

screenNumRef :: IORef Int
screenNumRef = unsafePerformIO $ newIORef 0
{-# NOINLINE screenNumRef #-}

getScreenNum :: MonadIO m => m Int
getScreenNum = liftIO $ readIORef screenNumRef

setScreenNum :: MonadIO m => Int -> m ()
setScreenNum x = liftIO $ writeIORef screenNumRef x

-------------------------------------------------------------------------------
-- Layout
-------------------------------------------------------------------------------

type (:$) = ModifiedLayout
type (:||) = Choose
infixr 6 :$
infixr 5 :||
type SimpleTab = Decoration TabbedDecoration DefaultShrinker :$ Simplest

type MyLayoutHook = Full
                :|| SimpleTab
                :|| CombineTwoP (TwoPane ()) SimpleTab SimpleTab
                :|| Tall

myLayoutHook :: MyLayoutHook Window
myLayoutHook = Full
           ||| simpleTabbed
           ||| combineTwoP (TwoPane (1/50) (1/2))
                  simpleTabbed simpleTabbed (Title "no title")
           ||| Tall 1 (3/100) (1/2)

hoge :: MonadIO m => m ()
hoge = do
  log' "hoge"

log' :: MonadIO m => String -> m ()
log' s = liftIO $ appendFile "/home/hogeyama/xmonad.mylog" (s <> "\n")

