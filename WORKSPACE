workspace(name = "bazelregistry_glad")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "io_bazel_rules_python",
  sha256 = "e06625b0947abed12f03d0f5a7007544a81d70d056fd2fb2c219fdb7048536d6",
  strip_prefix = "rules_python-fdbb17a4118a1728d19e638a5291b4c4266ea5b8",
  urls = ["https://github.com/bazelbuild/rules_python/archive/fdbb17a4118a1728d19e638a5291b4c4266ea5b8.zip"],
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_import")

pip_import(
  name = "glad_deps",
  requirements = "//:requirements.txt",
)

load("@glad_deps//:requirements.bzl", "pip_install")
pip_install()
