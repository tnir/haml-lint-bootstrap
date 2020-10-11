# frozen_string_literal: true

RSpec.describe HamlLint::Linter::BootstrapUtilities do
  include_context 'linter'

  context 'when tag has no BS display property class' do
    let(:haml) { '%tag' }

    it { should_not report_lint }
  end

  context 'when tag has non BS display property class' do
    let(:haml) { '.row' }

    it { should_not report_lint }
  end

  context 'when tag has non BS display property-formatted IDs' do
    let(:haml) { '#d-block#d-sm-none#d-md-inline#d-lg-table#d-xl-flex' }

    it { should_not report_lint }
  end

  context 'when tag has redundant BS display properties' do
    let(:haml) { '.d-none.d-sm-none.d-md-iline.d-lg-table.d-xl-flex' }

    it { should report_lint }
  end

  context 'when tag has two BS display properties with the same value which have a property with another value inbetween' do
    let(:haml) { '.d-none.d-sm-block.d-md-none' }

    it { should_not report_lint }
  end

  context 'when tag has two BS display properties with the same breakpoint and value' do
    let(:haml) { '.d-none.d-none' }

    it do
      # TODO
    end
  end
end
