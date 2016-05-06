require "spec_helper"

describe Healthcheck do
  before do
    described_class.remove
  end

  it "has a version number" do
    expect(Healthcheck::VERSION).not_to be nil
  end

  it "counts no healthcheck as a pass" do
    expect(described_class.passed?).to eq true
  end

  it "fails healthcheck" do
    described_class.add { false }
    expect(described_class.passed?).to eq false
  end

  it "passes healthcheck" do
    described_class.add { true }
    expect(described_class.passed?).to eq true
  end

  describe "middleware" do
    it "handles /healthcheck path with passing healthcheck" do
      app = double
      mw = described_class::Middleware.new(app)
      expect(mw.call("PATH_INFO" => "/healthcheck").first).to eq 200
    end

    it "handles /healthcheck path with failing healthcheck" do
      described_class.add { false }
      app = double
      mw = described_class::Middleware.new(app)
      expect(mw.call("PATH_INFO" => "/healthcheck").first).to eq 500
    end
  end

  it "does passes other paths through to app" do
    app = double call: nil
    mw = described_class::Middleware.new(app)
    env = { "PATH_INFO" => "/anotherpath" }
    mw.call env
    expect(app).to have_received(:call).with(env)
  end
end
