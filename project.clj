(defproject website "0.1.0-SNAPSHOT"
  :description "This is my about me page, available at pwalsh.me"
  :url "https://pwalsh.me"
  :license {:name "BSD 3 Clause"
            :url "http://opensource.org/licenses/BSD-3-Clause"}
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [clj-time "0.14.4"]
                 [endophile "0.2.1"]
                 [environ "1.1.0"]
                 [hiccup "1.0.5"]
                 [ring "1.7.0"]
                 [stasis "2.3.0"]]
  :ring {:handler website.core/handler}
  :main ^:skip-aot website.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}
             :dev {:plugins [[lein-environ "1.1.0"]
                             [lein-ring "0.12.4"]]
                   :env {:target-dir "output"}}}
  :aliases {"build" ["run" "-m" "website.core/export"]
            "serve" ["ring" "server-headless"]})
