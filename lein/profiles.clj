;; https://github.com/technomancy/leiningen/blob/master/doc/PROFILES.md
{:user
 {:plugins [[lein-pprint      "1.2.0"]
            [lein-figwheel    "0.5.17"]
            [lein-cljfmt      "0.6.1"  :exclusions [org.clojure/clojure]]
            [lein-ancient     "0.6.15" :exclusions [org.clojure/clojure]]

            ;; type checking for Clojure with Clojure core.typed
            [lein-typed       "0.4.6"]

            ;; lein kibit - check style
            [lein-kibit       "0.1.6"]

            [lein-bikeshed    "0.5.1"]
            [jonase/eastwood  "0.3.5"]
            [venantius/yagni  "0.1.7"]

            ;; lein-test when something changes
            [com.jakemccrary/lein-test-refresh  "0.21.1"]]

  :dependencies [[org.clojure/tools.nrepl "0.2.13"]]

  :aliases {"lint" ["do" ["kibit"] ["eastwood"] ["bikeshed"] ["yagni"]]}

  :repl-options {:timeout 300000
                 :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))}}}