{-# LANGUAGE MultiWayIf #-}
import Xmobar
import Data.List                 (intercalate)
import Graphics.X11.Xinerama     as X
import Graphics.X11.Xlib.Display as X
import Graphics.X11.Xlib.Types   as X

config :: Config
config = defaultConfig
    { font = "xft:Rounded Mgen+ 1mn:size=12"
    , bgColor = "#1a1e1b"
    , fgColor = "#676767"
    , lowerOnStart = True
    , position = Static { xpos = 1920 , ypos = 0, width = 1920, height = 20 }
    , commands = [ Run $ Network "wlp2s0" [ "-t"       , " ↓<rx> : ↑<tx> (Kb/s)"
                                          , "-L"       , "40"
                                          , "-H"       , "200"
                                          , "--normal" , "#d3d7cf"
                                          , "--high"   , "#88b986"
                                          --, "-S"       , "True"
                                          ] 10

                 , Run $ Cpu              [ "-t"      , "Cpu: <total>%"
                                          , "-L"      , "3"
                                          , "-H"      , "50"
                                          , "--normal", "green"
                                          , "--high"  , "red"
                                          ] 10

                 , Run $ Memory           [ "-t"       , "Mem: <usedratio>%"
                                          , "-L"       , "40"
                                          , "-H"       , "90"
                                          , "--normal" , "#d3d7cf"
                                          , "--high"   , "#c16666"
                                          ] 10

                 , Run $ BatteryP         ["BAT0"]
                                          [ "-t"       , "Bat: <acstatus>"
                                          , "-L"       , "20"
                                          , "-H"       , "80"
                                          , "--low"    , "#c16666"
                                          , "--normal" , "#d3d7cf"
                                          , "--"
                                                , "-o" , "<left>% (<timeleft>)"
                                                , "-O" , "Charging <left>%"
                                                , "-i" , "<left>%"
                                          ] 50
                 , Run $ Com "xmobar-volume" [] "volume" 10
                 , Run $ Volume "pulse" "Master" ["--", "-O", "[on]"] 10
                 , Run $ Com "dropbox" ["status"] "dropbox" 50
                 , Run $ Date "%a %m/%d %H:%M" "date" 10
                 , Run StdinReader
                 ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = left <> " }{ " <> right    }
  where
    left  = " %StdinReader% "
    right = intercalate "  ≫"
          [ "%wlp2s0%"
          , "%cpu%"
          , "%memory%"
          , "Dropbox: %dropbox%"
          --, "%volume%"
          , "%pulse:Master%"
          , "%battery%"
          ]
          <> " <fc=#c7a273>%date%</fc> "

isLab :: [X.Rectangle] -> Bool
isLab rs = rs ==
  [ Rectangle {rect_x = 0   , rect_y = 0, rect_width = 1920, rect_height = 1080}
  , Rectangle {rect_x = 1920, rect_y = 0, rect_width = 1920, rect_height = 1080}
  ]

isSingle :: [X.Rectangle] -> Bool
isSingle rs = rs ==
  [ Rectangle {rect_x = 0, rect_y = 0, rect_width = 1920, rect_height = 1080} ]

run :: X.Display -> IO ()
run display = do
  rs <- X.getScreenInfo display
  let config'
        | isLab rs    = config { position = Static { xpos = 1920, ypos = 0  , width = 1920, height = 20 } }
        | isSingle rs = config { position = Static { xpos = 0   , ypos = 0  , width = 1920, height = 20 } }
        | otherwise   = config { position = Static { xpos = 15  , ypos = 10 , width = 1245, height = 20 } } -- 小さいdisplay
        | otherwise   = config { position = Static { xpos = 0   , ypos = 720, width = 1920, height = 20 } } -- laptopのdisplay
  xmobar config'

main :: IO ()
main = Main.run =<< X.openDisplay ""

