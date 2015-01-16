require "test_helper"

class UtilsTest < Test::Unit::TestCase

  def valid_certificate
    read_certificate("valid_certificate")
  end

  context ".format_cert" do
    should "return the certificate when it is valid" do
      assert_equal valid_certificate, OneLogin::RubySaml::Utils.format_cert(valid_certificate)
    end

    should "reformat the certificate when there are spaces and no line breaks" do
      invalid_certificate1 = read_certificate("invalid_certificate1")
      assert_equal valid_certificate, OneLogin::RubySaml::Utils.format_cert(invalid_certificate1)
    end

    should "reformat the certificate when there are spaces and no headers" do
      invalid_certificate2 = read_certificate("invalid_certificate2")
      assert_equal valid_certificate, OneLogin::RubySaml::Utils.format_cert(invalid_certificate2)
    end

    should "reformat the certificate when there line breaks and no headers" do
      invalid_certificate3 = read_certificate("invalid_certificate3")
      assert_equal valid_certificate, OneLogin::RubySaml::Utils.format_cert(invalid_certificate3)
    end
  end
end
