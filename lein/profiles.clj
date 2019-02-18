;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[lein-pprint      "1.2.0"]
                  [lein-figwheel    "0.5.17"]
                  [lein-ancient     "0.6.15"]
                  [lein-cljfmt      "0.6.1"]

                  ;; type checking for Clojure with Clojure core.typed
                  [lein-typed       "0.4.6"]

                  ;; Code quality - style check
                  [lein-kibit       "0.1.6"]
                  [lein-bikeshed    "0.5.1"]
                  [jonase/eastwood  "0.2.9" :exclusions [org.clojure/clojure]]

                  ;; Refresh test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.21.1"]]

        :dependencies [[org.clojure/tools.nrepl "0.2.13"]
                       [slamhound               "RELEASE"]]

        :aliases {"slamhound" ["run" "-m" "slam.hound"]
                  "lint" ["do" ["kibit"] ["eastwood"] ["bikeshed"]]}

        :repl-options {:timeout 300000
                       :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))} }}