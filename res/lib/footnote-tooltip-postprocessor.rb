# Adapted from https://gist.github.com/sudofoobar/074f723b0e0d286a9012bcb6a786a400
require 'asciidoctor/extensions'
require 'nokogumbo'

Asciidoctor::Extensions.register do
  postprocessor FootnoteTooltipPostprocessor
end

class FootnoteTooltipPostprocessor < Asciidoctor::Extensions::Postprocessor
  def process document, output
    if document.attributes.key?('noheader')
      outdoc = Nokogiri::HTML5.fragment(output)
    else
      outdoc = Nokogiri::HTML5(output)
    end

# TODO: fix footnote references
#     foot_refs = outdoc.search('sup.footnote a, sup.footnoteref a')
    foot_refs = outdoc.search('sup.footnote a')
    printf "foot_refs %s\n", foot_refs
    for footnote in document.footnotes
      printf "\nfootnote %s\n", footnote
      index = footnote.index.tr('٠١٢٣٤٥٦٧٨٩','0123456789')
      node = foot_refs[index.to_i - 1]
      printf "node %s\n", node
      orig_str = node.serialize
      printf "orig_str %s\n", orig_str
      node['title'] = Nokogiri::HTML5.fragment(footnote.text).xpath('.//text()').text
      printf "node with new title %s\n", node
      output = output.sub(orig_str, node.serialize)
    end
    output
  end
end
