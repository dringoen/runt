
#!/usr/bin/env ruby

require 'baseexpressiontest'

# Unit tests for TemporalRange class
# Author:: Matthew Lipper

class TemporalRangeTest < BaseExpressionTest

  def test_include
    rspec = TemporalRange.new(@stub1)
    assert !rspec.include?("Any Object"), "Expression should not include any given argument"
    @stub1.match = true
    assert rspec.include?("Any Object"), "Expression should include any given argument"
  end

  def test_overlap
    range = DateRange.new(@date_20050101, @date_20050109)
    rspec = TemporalRange.new(range)
    assert !rspec.include?(@date_20050116), "Expression #{rspec.to_s} should not include #{@date_20050116.to_s}"
    assert rspec.include?(@date_20050102), "Expression #{rspec.to_s} should include #{@date_20050102.to_s}"
  end

end
