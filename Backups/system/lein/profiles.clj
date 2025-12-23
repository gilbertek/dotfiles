;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:signing {:gpg-key "gilberts55@hotmail.com"}
        :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]

        :plugins [[cider/cider-nrepl                 "0.21.1"]
                  [lein-ancient                      "0.6.15"]
                  [lein-figwheel                     "0.5.19"]
                  [com.jakemccrary/lein-test-refresh "0.23.0"]

                  ;; type checking for Clojure with Clojure core.typed
                  [lein-typed                        "0.4.6"]

                  ;; Code quality - style check
                  [lein-bikeshed    "0.5.2"]
                  [lein-kibit       "0.1.6" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood  "0.3.5" :exclusions [org.clojure/clojure]]
                  [lein-cljfmt      "0.6.1"
                    :exclusions [org.clojure/clojure org.clojure/tools.reader]]
                  [jonase/eastwood  "0.3.3" :exclusions [org.clojure/clojure]]

                  [lein-cprint      "1.3.1" :exclusions [fipp org.clojure/clojure]]
                  [lein-try         "0.4.3"]
                  [fipp             "0.6.18"]]

        :dependencies [[org.clojure/tools.nrepl     "0.2.13"]
                      [pjstadig/humane-test-output "0.9.0"]
                      [slamhound                   "1.5.5"]]

        :test-refresh {:notify-command ["terminal-notifier"
                                        "-title" "Tests" "-message"]}

        :aliases {"slamhound" ["run" "-m" "slam.hound"]
                  "lint" ["do" ["kibit"] ["eastwood"] ["bikeshed"]]}

        :repl-options {:timeout 300000
                      :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))} }}