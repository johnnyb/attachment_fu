require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class AutothumbTest < Test::Unit::TestCase
  def test_autothumb_resizes
    att = upload_file :filename => '/files/rails.png'
    assert_valid att

    thumb25 = att.autothumb(:width => 25)
    assert_equal 25, thumb25.width
    
    thumbx25 = att.autothumb(:height => 25)
    assert_equal 25, thumbx25.height

    thumbexact = att.autothumb(:width => 10, :height => 22, :exact => 1)
    assert_equal 10, thumbexact.width
    assert_equal 22, thumbexact.height
  end

  def test_autothumb_resizes_once
    att = upload_file :filename => '/files/rails.png'
    assert_valid att

    thumb1 = att.autothumb(:width => 25)
    thumb2 = att.autothumb(:height => 50)
    thumb3 = att.autothumb(:width => 25)

    assert_equal thumb1.id, thumb3.id
    assert_not_equal thumb1.id, thumb2.id
  end
end
