describe Kaseifu::ActionView::Helpers::RenderingHelper, type: :helper do
  describe '#render_if_present' do
    context 'method is present' do
      context 'default behavior' do
        let(:shop_image_path) { '/path/to/image.jpg' }
        let(:shop) do
          double(:shop, image_path: shop_image_path)
        end

        it 'should render "ok" with default options' do
          expect(helper).to receive(:render)
            .with({ partial: 'image_path', locals: { image_path: shop_image_path } }, {})
            .and_return('ok')
          expect(render_if_present(:image_path, in: shop)).to eq 'ok'
        end
      end

      context 'modify partial path' do
        let(:shop_image_path) { '/path/to/image.jpg' }
        let(:shop) do
          double(:shop, image_path: shop_image_path)
        end

        it 'should render "ok" with modified partial path' do
          expect(helper).to receive(:render)
            .with({ partial: 'modified_path', locals: { image_path: shop_image_path } }, {})
            .and_return('ok')
          expect(render_if_present(:image_path, in: shop, partial: 'modified_path')).to eq 'ok'
        end
      end

      context 'pass more locals' do
        let(:shop_image_path) { '/path/to/image.jpg' }
        let(:shop) do
          double(:shop, image_path: shop_image_path)
        end

        it 'should render "ok" with added locals' do
          expect(helper).to receive(:render)
            .with({ partial: 'image_path', locals: { image_path: shop_image_path, shop_name: 'd-mall01' } }, {})
            .and_return('ok')
          expect(render_if_present(:image_path, in: shop, locals: { shop_name: 'd-mall01' })).to eq 'ok'
        end
      end

      context 'modify variable name' do
        let(:shop_image_path) { '/path/to/image.jpg' }
        let(:shop) do
          double(:shop, image_path: shop_image_path)
        end

        it 'should render "ok" with modified name' do
          expect(helper).to receive(:render)
            .with({ partial: 'shop_image', locals: { shop_image: shop_image_path } }, {})
            .and_return('ok')
          expect(render_if_present(:image_path, in: shop, as: 'shop_image')).to eq 'ok'
        end
      end
    end

    context 'method is not present' do
      let(:shop) do
        double(:shop)
      end

      it 'should render nothing' do
        expect(render_if_present(:image_path, in: shop)).to eq ''
      end
    end

    context 'method is exist but return nil' do
      let(:shop) do
        double(:shop, image_path: nil)
      end

      it 'should render nothing' do
        expect(render_if_present(:image_path, in: shop)).to eq ''
      end
    end
  end
end
