# frozen_string_literal: true

module HamlLint
  class Linter::BootstrapUtilities < Linter
    include LinterRegistry

    def visit_tag(node)
      check_duplicated_display_property(node)
    end

    private

    def check_duplicated_display_property(node)
      breakpoints = %w(xs sm md lg xl).freeze

      values = {}
      node.static_classes.each do |cl|
        if (matched = /\Ad-(?:(xs|sm|md|lg|xl)-)?(none|inline-block|block|table|table-cell|table-row|flex|inline-flex)\Z/.match(cl[0]))
          breakpoint = matched[1] || "xs"
          value = matched[2]
          record_lint(node, ".#{cl} definition conflicts `.d-#{breakpoint}-#{values.key(breakpoint)}") if values.key(breakpoint)
          values[breakpoint] = value
        end
      end

      # no Bootstrap display property found or only a single static class found
      return if values.empty? || values.size < 2

      prev_v = ""
      prev_b = ""
      breakpoints.each do |b|
        v = values[b]
        if v
          if v == prev_v
            record_lint(node, ".d-#{b}-#{v} looks duplicated as `.d-#{prev_b}-#{prev_v}. You can safely remove `.d-#{b}-#{v}` from `%#{node.tag_name}`.")
          end
          prev_v = v
          prev_b = b
        end
      end
    end
  end
end
