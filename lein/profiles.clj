;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[lein-pprint                        "1.2.0"]
                  [lein-figwheel                      "0.5.17"]

                  ;; check for outdated dependencies and plugins
                  [lein-ancient                       "0.6.15"]

                  ;; Clojure test coverage tool
                  [lein-cloverage                     "1.0.13"]

                  ;; Clojure code formatting tool
                  [lein-cljfmt                        "0.6.1"]

                  ;; genere API docu from clj or cljs source
                  [lein-codox                         "0.10.5"]

                  ;; type checking for Clojure with Clojure core.typed
                  [lein-typed                         "0.4.6"]

                  ;; lein kibit - check style
                  [lein-kibit                         "0.1.6"]

                  [lein-bikeshed                      "0.5.1"]
                  [jonase/eastwood                    "0.2.9"
                   :exclusions [org.clojure/clojure]]

                  ;; make ClojureScript development easy.
                  [lein-cljsbuild                     "1.1.7"]

                  ;; lein-test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.21.1"]]

        :middlewares [[venantius/ultra                "0.5.2"]
                      [refactor-nrepl                 "2.4.0"]

                      ;; collection of nREPL middleware designed to enhance CIDER
                      [cider/cider-nrepl              "0.20.0"]
                      [lein-fore-prob                 "0.1.2"]
                      [lein-gorilla                   "0.4.0"]
                      [lein-midje                     "3.2.1"]]

        :dependencies [[org.clojure/clojure "1.10.0"]
                       [org.clojure/tools.nrepl "0.2.13"]
                       [org.clojure/tools.namespace   "0.2.11"]
                       [com.bhauman/rebel-readline    "0.1.4"]
                       [midje "1.6.0"
                        :exclusions [org.clojure/clojure]]
                       [slamhound                     "RELEASE"]]

        :aliases {"slamhound" ["run" "-m" "slam.hound"]
                  "rebl" ["trampoline" "run" "-m" "rebel-readline.main"]
                  "lint" ["do" ["kibit"] ["eastwood"] ["bikeshed"] ["yagni"]]}

        :repl-options {:prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))}}}
