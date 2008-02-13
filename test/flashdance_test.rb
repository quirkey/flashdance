require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class FlashdanceTest < Test::Unit::TestCase
  include Quirkey::Flashdance
  
  def setup
    Loader.yml_path = yml_path
  end
  
  def test_loader_should_load_yml_file
    loader = Loader.new
    assert loader.entries.is_a?(Hash)
    assert loader.entries.has_key?('all_is_good')
  end
  
  def test_should_get_specific_entry_in_yaml_file_by_string
    text = flashdance('this_failed')
    assert_equal 'This failed', text
  end

  def test_should_get_specific_entry_in_yaml_file_by_symbol
    text = flashdance(:this_failed)
    assert_equal 'This failed', text
  end

  def test_should_raise_error_if_entry_does_not_exist
    assert_raise(Quirkey::Flashdance::NoEntryError) do
      text = flashdance('im_an_entry_that_dont_exist')
    end
  end
  
  def test_flashdance_should_evaluate_inline_erb_in_current_context
    flash_ahead
    @email = "email@example.com"
    text = flashdance(:using_erb)
    assert_equal "your are an idiot, #{@email}", text
  end
  
  def test_flashdance_should_get_entry_organized_into_section
    text = flashdance([:controller, :action])
    assert_equal "I'm nested", text
  end
  
end