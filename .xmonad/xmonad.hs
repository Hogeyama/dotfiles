
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE LambdaCase        #-}
{-# OPTIONS_GHC -Wall          #-}

module Main where

import           RIO
import           XMonad
import           XMonad.Config.Prime            (io)
import           XMonad.Hooks.EwmhDesktops      (ewmh)
import           XMonad.Hooks.DynamicLog        (PP(..), statusBar, xmobarPP)
import           XMonad.Hooks.ManageDocks       (AvoidStruts, manageDocks)
import           XMonad.Operations              (kill)
import qualified XMonad.StackSet                as W
import           XMonad.Util.EZConfig           (additionalKeys, additionalKeysP)
import           XMonad.Layout                  (Choose, Full(..), (|||))
import           XMonad.Layout.Decoration       (Decoration, DefaultShrinker)
import           XMonad.Layout.LayoutModifier   (ModifiedLayout)
--import           XMonad.Layout.WindowNavigation (Navigate(..))
import           XMonad.Layout.Simplest         (Simplest)
--import           XMonad.Layout.Combo
import           XMonad.Layout.ComboP
import           XMonad.Layout.TwoPane
import           XMonad.Layout.Tabbed
--import           XMonad.Layout.Accordion
--import           XMonad.Layout.ResizableTile
import           System.Exit                    (exitSuccess)
--import           System.Process.Typed
import           XMonad.Util.Run
--

main :: IO ()
main = xmonad =<< xmobar' (ewmh myConfig)
  where
    myConfig = def
      { modMask            = mod4Mask
      , terminal           = "gnome-terminal"
      , workspaces         = myWorkspaces
      , borderWidth        = 5
      , focusedBorderColor = "#00bfff"
      , manageHook         = manageDocks <+> manageHook def
      , layoutHook         = myLayoutHook
      , startupHook        = mapM_ spawn [ "dropbox start"
                                         , "unity-settings-daemon"
                                         , "feh --bg-scale /home/hogeyama/Dropbox/WallPapers/PrincessPrincipalOST-screen.jpg"
                                         , "compton -CG --active-opacity 1.0 --shadow-ignore-shaped"
                                         ]
      }

      `additionalKeysP`
      [ ("M-g"          , spawn "google-chrome")
      , ("M-S-g"        , spawn "vivaldi")
      , ("M-p"          , spawn "gmrun")
      , ("M-S-q"        , kill)
      , ("M-S-C-q"      , io exitSuccess)
      , ("M-x"          , spawn "slock")
      , ("M-S-x"        , spawn "systemctl suspend")
      , ("M-<Return>"   , forcusNextScreen)
      , ("M-C-<Return>" , shiftNextScreen)
      --, ("M-S-<Return>" , spawn "nvim-wrapper")
      , ("M-S-s"        , spawn "gnome-terminal")
      , ("M-s"          , swapScreen)
      , ("M-a"          , sendMessage SwapWindow)
      , ("M-S-a"        , hoge) -- なんか動作の確認に
      , ("M-S-k"        , spawn "amixer -D pulse sset Master 2%+")
      , ("M-S-j"        , spawn "amixer -D pulse sset Master 2%-")
      , ("M-S-o"        , spawn "amixer -D pulse sset Master 0%")
      , ("M-m"          , toggleTouchPad)
      ]

      `additionalKeysP`
      [ ("<XF86AudioRaiseVolume>"  , spawn "amixer -D pulse sset Master 2%+")
      , ("<XF86AudioLowerVolume>"  , spawn "amixer -D pulse sset Master 2%-")
      , ("<XF86AudioMute>"         , spawn "amixer -D pulse sset Master 0%" )
      , ("M-<XF86AudioRaiseVolume>", spawn "xbacklight -inc 10")
      , ("M-<XF86AudioLowerVolume>", spawn "xbacklight -dec 10")
      , ("M-<XF86AudioMute>"       , spawn $ unwords ["scrot ", screenShotName])
      ]

      `additionalKeys`
      [((m .|. mod4Mask, k), windows $ f i)
      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

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

-- headではなくlastをとったほうがいいかも(3スクリーン以上でないと確かめられない)
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

toggleTouchPad :: X ()
toggleTouchPad = do
    out <- runProcessWithInput "gsettings"
              ["get"
              , "org.gnome.desktop.peripherals.touchpad"
              , "send-events"
              ]
              ""
    case out of
      "'enabled'\n"  -> setTouchPad False
      "'disabled'\n" -> setTouchPad True
      _ -> error' $ "toggleTouchPad: unknown input: " <> show out
  where
    error' s = log' s >> error s

-- touchpad =$(gsettings list-schemas | grep touchpad)
-- gsettings list-keys $touchpad
-- gsettings range $touchpad some-key

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

-- xmobarにLayout名を表示しない
xmobar' :: LayoutClass l Window
        => XConfig l -> IO (XConfig (ModifiedLayout AvoidStruts l))
xmobar' = statusBar "xmobar" xmobarPP' toggleStrutsKey
  where
    xmobarPP' = xmobarPP { ppLayout = const "" }
    toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b )

-- XState = { windowset :: WindowSet , ...}
-- WindowSet = StackSet WorkspaceId (Layout Window) Window ScreenId ScreenDetail
-- StackSet i l a sid sd =
--    { current  ::  Screen i l a sid sd  -- forcused workspace
--    , visible  :: [Screen i l a sid sd] -- 別のスクリーンに写ってる
--    , hidden   :: [Workspace i l a ]    -- 別のスクリーンに写ってる
--    , floating :: Map a RationalRect
--    }
-- Workspace i l a =
--    { tag    :: i
--    , layout :: l
--    , stack  :: Maybe (Stack a)
--    }
-- Stack a =
--    { focus :: a
--    , up    :: [a]
--    , down  :: [a]
--    }
--  WindowはX11で定義されている

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

myLayoutHook :: MyLayoutHook Window
myLayoutHook = Full
           ||| simpleTabbed
           ||| combineTwoP (TwoPane (1/50) (1/2))
                  simpleTabbed simpleTabbed (Title "no title")

hoge :: X ()
hoge = do
  log' "fugafuga"
  log' $ show xK_F8
  log' $ show xK_P

  --n <- countScreens :: X Int
  --log' (show n)

log' :: String -> X ()
log' s = spawn $ "echo " ++ show s ++ " >> /home/hogeyama/xmonad.mylog"

