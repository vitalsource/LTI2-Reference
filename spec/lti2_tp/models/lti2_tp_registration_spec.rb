require 'spec_helper'

describe Lti2Tp::Registration do

  context 'create status' do
    describe 'when failure' do
      it 'should return failure' do
        new_reg = Lti2Tp::Registration.new
        status = new_reg.create_status(false)
        expect(status).to include('status=failure')
        expect(status).to include('lti_errormsg=')
        expect(status).to include('&lti_errorlog=&')
      end

      it 'should return message if message is present' do
        new_reg = Lti2Tp::Registration.new
        status = new_reg.create_status(false, nil, 'atestmessage')
        expect(status).to include('status=failure')
        expect(status).to include('lti_errormsg=atestmessage')
        expect(status).to include('lti_errorlog=atestmessage')
      end
    end

    describe 'when success' do
      it 'should return success if is_success is true' do
        new_reg = Lti2Tp::Registration.new
        status = new_reg.create_status(true)
        expect(status).to include('status=success')
      end

      it 'should return tool_proxy_guid when present' do
        new_reg = Lti2Tp::Registration.new
        status = new_reg.create_status(true, '12345')
        expect(status).to include('status=success')
        expect(status).to include('tool_proxy_guid=12345')
      end
    end
  end

end
