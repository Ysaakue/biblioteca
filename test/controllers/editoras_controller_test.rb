require 'test_helper'

class EditorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editora = editoras(:one)
  end

  test "should get index" do
    get editoras_url
    assert_response :success
  end

  test "should get new" do
    get new_editora_url
    assert_response :success
  end

  test "should create editora" do
    assert_difference('Editora.count') do
      post editoras_url, params: { editora: { cidade_id: @editora.cidade_id, estado_id: @editora.estado_id, nome: @editora.nome } }
    end

    assert_redirected_to editora_url(Editora.last)
  end

  test "should show editora" do
    get editora_url(@editora)
    assert_response :success
  end

  test "should get edit" do
    get edit_editora_url(@editora)
    assert_response :success
  end

  test "should update editora" do
    patch editora_url(@editora), params: { editora: { cidade_id: @editora.cidade_id, estado_id: @editora.estado_id, nome: @editora.nome } }
    assert_redirected_to editora_url(@editora)
  end

  test "should destroy editora" do
    assert_difference('Editora.count', -1) do
      delete editora_url(@editora)
    end

    assert_redirected_to editoras_url
  end
end
