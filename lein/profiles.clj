;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[venantius/ultra                    "0.5.2"]
                  [lein-figwheel                      "0.5.16"]
                  [refactor-nrepl                     "2.4.0"]
                  [cider/cider-nrepl                  "0.18.0"]
                  [lein-fore-prob                     "0.1.2"]
                  [lein-gorilla                       "0.4.0"]
                  [lein-midje                         "3.2.1"]

                  ; Clojure test coverage tool
                  [lein-cloverage                     "1.0.13"]

                  ; Clojure code formatting tool
                  [lein-cljfmt                        "0.6.1"]

                  ; Check for outdated dependencies
                  [lein-ancient                       "0.6.15"]

                  ; Check for bad coding style
                  [lein-bikeshed                      "0.5.1"]
                  [lein-kibit                         "0.1.6"]
                  [jonase/eastwood                    "0.2.9"
                   :exclusions [org.clojure/clojure]]

                  ; lein-test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.21.1"]]

        :dependencies [[org.clojure/clojure           "1.9.0"]
                       [org.clojure/clojurescript     "1.10.238"]
                       [org.clojure/tools.nrepl       "0.2.13"]
                       [org.clojure/tools.namespace   "0.2.11"]
                       [cider/piggieback              "0.3.9"]
                       [midje "1.6.0"                 :exclusions [org.clojure/clojure]]
                       [slamhound                     "RELEASE"]]


        :aliases {"slamhound" ["run" "-m" "slam.hound"]}

        :repl-options {:prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))
                       :nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}
