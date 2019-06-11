def cc_glad_library(name, api, api_version):
  glad_hdrs = []
  glad_srcs = []

  if api == "vulkan":
    glad_hdrs = [
      "include/glad/vulkan.h",
      "include/vk_platform.h",
    ]
    glad_srcs = [
      "src/vulkan.c",
    ]
  elif api == "gl:core":
    glad_hdrs = [
      "include/glad/gl.h",
      "include/KHR/khrplatform.h",
    ]
    glad_srcs = [
      "src/gl.c",
    ]
  elif api == "gl:compatibility":
    glad_hdrs = [
      "include/glad/gl.h",
      "include/KHR/khrplatform.h",
    ]
    glad_srcs = [
      "src/gl.c",
    ]
  else:
    fail("Unsupported glad api '{}'".format(api), "api")

  genrule_name = "_cc_glad_library_{}_{}".format(
    api.replace(":", "_"),
    api_version.replace(".", "_"),
  )

  if native.existing_rule(genrule_name) == None:
    native.genrule(
      name = genrule_name,
      srcs = [],
      outs = glad_hdrs + glad_srcs,
      message = "Running glad",
      tools = ["@bazelregistry_glad//glad"],
      cmd = "$(location @bazelregistry_glad//glad) --quiet --out-path $(@D) --api {}={} c".format(api, api_version),
    )

  native.cc_library(
    name = name,
    strip_include_prefix = "include",
    hdrs = glad_hdrs,
    srcs = glad_srcs + glad_hdrs,
  )
