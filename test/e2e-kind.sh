#!/usr/bin/env bash

# Copyright 2020 The Knative Authors
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

set -Eeo pipefail

source "$(dirname "${BASH_SOURCE[0]:-$0}")/../e2e-tests.sh"

function knative_setup() {
  start_latest_knative_serving
}

# Script entry point.
initialize "$@" --cloud-provider kind -v 9

go_test_e2e ./test/e2e || fail_test

success
