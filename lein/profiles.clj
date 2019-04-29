;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user {:plugins [[cider/cider-nrepl "0.21.1"]
                  [lein-pprint      "1.2.0"]
                  [lein-figwheel    "0.5.18"]
                  [lein-ancient     "0.6.15"]
                  [lein-cljfmt      "0.6.4"]

                  ;; type checking for Clojure with Clojure core.typed
                  [lein-typed       "0.4.6"]

                  ;; Code quality - style check
                  [lein-kibit       "0.1.6" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed    "0.5.2"]
                  [jonase/eastwood  "0.3.5" :exclusions [org.clojure/clojure]]

                  ;; Refresh test when something changes
                  [com.jakemccrary/lein-test-refresh  "0.24.1"]]

        ;; Leiningen now requires explicit middleware declarations.
        :middleware [cider-nrepl.plugin/middleware]

        :dependencies [[org.clojure/tools.nrepl "0.2.13"]
                       [slamhound               "1.5.5"]
                       [pjstadig/humane-test-output "0.9.0"]]

        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]

        :aliases {"slamhound" ["run" "-m" "slam.hound"]
                  "lint" ["do" ["kibit"] ["eastwood"] ["bikeshed"]]}

        :repl-options {:timeout 300000
                       :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))} }}