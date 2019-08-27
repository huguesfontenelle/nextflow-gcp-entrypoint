process test {
  publishDir "${params.outDir}"

  input:
  val a from Channel.from("hello")

  output:
  file("result.txt")

  script:
  """
  echo ${a} > result.txt
  """
}
