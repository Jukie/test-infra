# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

def repositories():
    git_repository(
        name = "io_k8s_repo_infra",
        commit = "db6ceb5f992254db76af7c25db2edc5469b5ea82",
        remote = "https://github.com/kubernetes/repo-infra.git",
        shallow_since = "1570128715 -0700",
    )
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "e513c0ac6534810eb7a14bf025a0f159726753f97f74ab7863c650d26e01d677",
        strip_prefix = "rules_docker-0.9.0",
        urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.9.0.tar.gz"],
    )

    git_repository(
        name = "io_bazel_rules_k8s",
        commit = "e7ae2825f0296314ac1ecf13e4c9acef66597986",
        remote = "https://github.com/bazelbuild/rules_k8s.git",
        shallow_since = "1565892120 -0400",
    )

    # https://github.com/bazelbuild/rules_nodejs
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "9abd649b74317c9c135f4810636aaa838d5bea4913bfa93a85c2f52a919fdaf3",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.36.0/rules_nodejs-0.36.0.tar.gz"],
    )

    # Python setup
    # pip_import() calls must live in WORKSPACE, otherwise we get a load() after non-load() error
    git_repository(
        name = "io_bazel_rules_python",
        commit = "9d68f24659e8ce8b736590ba1e4418af06ec2552",
        remote = "https://github.com/bazelbuild/rules_python.git",
        shallow_since = "1565801665 -0400",
    )

    # TODO(fejta): get this to work
    git_repository(
        name = "io_bazel_rules_appengine",
        commit = "fdbce051adecbb369b15260046f4f23684369efc",
        remote = "https://github.com/bazelbuild/rules_appengine.git",
        shallow_since = "1552415147 -0400",
        #tag = "0.0.8+but-this-isn't-new-enough", # Latest at https://github.com/bazelbuild/rules_appengine/releases.
    )

    new_git_repository(
        name = "com_github_operator_framework_community_operators",
        build_file_content = """
exports_files([
    "upstream-community-operators/prometheus/alertmanager.crd.yaml",
    "upstream-community-operators/prometheus/prometheus.crd.yaml",
    "upstream-community-operators/prometheus/prometheusrule.crd.yaml",
    "upstream-community-operators/prometheus/servicemonitor.crd.yaml",
])
""",
        commit = "efda5dc98fd580ab5f1115a50a28825ae4fe6562",
        remote = "https://github.com/operator-framework/community-operators.git",
        shallow_since = "1568320223 +0200",
    )

    http_archive(
        name = "io_bazel_rules_jsonnet",
        sha256 = "59bf1edb53bc6b5adb804fbfabd796a019200d4ef4dd5cc7bdee03acc7686806",
        strip_prefix = "rules_jsonnet-0.1.0",
        urls = ["https://github.com/bazelbuild/rules_jsonnet/archive/0.1.0.tar.gz"],
    )
