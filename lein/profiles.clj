;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[lein-fore-prob                     "0.1.2"]
                  [lein-cloverage                     "1.0.9"]
                  [refactor-nrepl                     "2.4.0-SNAPSHOT"]
                  [cider/cider-nrepl                  "0.18.0"]
                  [lein-figwheel                      "0.5.10"]
                  [venantius/ultra                    "0.5.1"]

                  ; Check for outdated dependencies
                  [lein-ancient                       "0.6.15"]

                  ; Check for bad coding style
                  [lein-bikeshed                      "0.5.1"]
                  [lein-kibit                         "0.1.6"]
                  [jonase/eastwood                    "0.2.9"
                    :exclusions [org.clojure/clojure]]

                  ;; lein-test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.21.1"]]
        :dependencies [
                       [org.clojure/tools.nrepl       "0.2.13"]
                       [org.clojure/tools.namespace   "0.2.11"]
                       [cljfmt                        "RELEASE"]]
        :repl-options
        {:nrepl-middleware [cider.nrepl/wrap-complete
                            cider.nrepl/wrap-format
                            cider.nrepl/wrap-info
                            cider.nrepl/wrap-macroexpand
                            cider.nrepl/wrap-ns
                            cider.nrepl/wrap-out
                            cider.nrepl/wrap-spec
                            cider.nrepl/wrap-test
                            cider.nrepl/wrap-undef]}

        }
 }
