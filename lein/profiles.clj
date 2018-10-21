; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[venantius/ultra                    "0.5.2"]
                  [lein-figwheel                      "0.5.16"]
                  [cider/cider-nrepl                  "0.18.0"]
                  [lein-fore-prob                     "0.1.2"]
                  [lein-gorilla                       "0.4.0"]
                  [lein-midje                         "3.2.1"]

                  ; Clojure test coverage tool
                  [lein-cloverage                     "1.0.13"]

                  ; Clojure code formatting tool
                  [lein-cljfmt                        "0.6.1"]

                  ; Check for bad coding style
                  [lein-bikeshed                      "0.5.1"]
                  [lein-kibit                         "0.1.6"]
                  [jonase/eastwood                    "0.2.9"
                   :exclusions [org.clojure/clojure]]

                  ; lein-test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.21.1"]]

        :dependencies [[nrepl                         "0.4.5"]
                       [org.clojure/tools.namespace   "0.2.11"]
                       [com.bhauman/rebel-readline    "0.1.4"]
                       [midje "1.6.0"                 :exclusions [org.clojure/clojure]]
                       [slamhound                     "RELEASE"]]

        :aliases {"slamhound" ["run" "-m" "slam.hound"]
                  "rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}

        :repl-options {:prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))}}}
