; -*- mode: Lisp;-*-

(sources
  /src/main/resources/assets/computercraft/lua/bios.lua
  /src/main/resources/assets/computercraft/lua/rom/
  /src/test/resources/test-rom)

(at /
  (linters
    ;; It'd be nice to avoid this, but right now there's a lot of instances of
    ;; it.
    -var:set-loop

    ;; It's useful to name arguments for documentation, so we allow this. It'd
    ;; be good to find a compromise in the future, but this works for now.
    -var:unused-arg

    ;; Suppress a couple of documentation comments warnings for now. We'll
    ;; hopefully be able to remove them in the coming weeks.
    -doc:detached-comment -doc:undocumented -doc:undocumented-arg
    -doc:unresolved-reference))

;; We disable the unused global linter in bios.lua and the APIs. In the future
;; hopefully we'll get illuaminate to handle this.
(at
  (/src/main/resources/assets/computercraft/lua/bios.lua
   /src/main/resources/assets/computercraft/lua/rom/apis/)
  (linters -var:unused-global)
  (lint
    (allow-toplevel-global true)))
