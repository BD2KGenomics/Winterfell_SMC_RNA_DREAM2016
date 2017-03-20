#!/usr/bin/env cwl-runner

cwlVersion: "v1.0"

class: CommandLineTool


requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: quay.io/ucsc_cgl/dockstore_tool_star_fusion

inputs:

  - id: input
    type: File
    inputBinding:
      position: 1

  - id: output
    type: string

outputs:
  - id: fusionout
    type: File
    outputBinding:
      glob: $(inputs.output)

stdout: $(inputs.output)

baseCommand: [convert_star_to_bedpe.py]
