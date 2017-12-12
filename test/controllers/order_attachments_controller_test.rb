require 'test_helper'

class OrderAttachmentsControllerTest < ActionController::TestCase
  setup do
    @order_attachment = order_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_attachment" do
    assert_difference('OrderAttachment.count') do
      post :create, order_attachment: { avatar: @order_attachment.avatar, order_id: @order_attachment.order_id }
    end

    assert_redirected_to order_attachment_path(assigns(:order_attachment))
  end

  test "should show order_attachment" do
    get :show, id: @order_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_attachment
    assert_response :success
  end

  test "should update order_attachment" do
    patch :update, id: @order_attachment, order_attachment: { avatar: @order_attachment.avatar, order_id: @order_attachment.order_id }
    assert_redirected_to order_attachment_path(assigns(:order_attachment))
  end

  test "should destroy order_attachment" do
    assert_difference('OrderAttachment.count', -1) do
      delete :destroy, id: @order_attachment
    end

    assert_redirected_to order_attachments_path
  end
end
