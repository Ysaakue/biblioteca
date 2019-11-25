require 'test_helper'

class AssuntosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assunto = assuntos(:one)
  end

  test "should get index" do
    get assuntos_url
    assert_response :success
  end

  test "should get new" do
    get new_assunto_url
    assert_response :success
  end

  test "should create assunto" do
    assert_difference('Assunto.count') do
      post assuntos_url, params: { assunto: { descricao: @assunto.descricao } }
    end

    assert_redirected_to assunto_url(Assunto.last)
  end

  test "should show assunto" do
    get assunto_url(@assunto)
    assert_response :success
  end

  test "should get edit" do
    get edit_assunto_url(@assunto)
    assert_response :success
  end

  test "should update assunto" do
    patch assunto_url(@assunto), params: { assunto: { descricao: @assunto.descricao } }
    assert_redirected_to assunto_url(@assunto)
  end

  test "should destroy assunto" do
    assert_difference('Assunto.count', -1) do
      delete assunto_url(@assunto)
    end

    assert_redirected_to assuntos_url
  end
end
