require_relative 'spec_helper'

describe "Root filesystem" do
  let(:stdout) { run_mounted("cat /etc/os-release").stdout }

  it "is based on debian" do
    expect(stdout).to contain('debian')
  end

  it "is debian version jessie" do
    expect(stdout).to contain('jessie')
  end

  it "is a HypriotOS" do
    expect(stdout).to contain('HypriotOS')
  end

  it "has a HYPRIOT_OS= entry" do
    expect(stdout).to contain('^HYPRIOT_OS=')
  end
  it "has a HYPRIOT_OS_VERSION= entry" do
    expect(stdout).to contain('^HYPRIOT_OS_VERSION=')
  end
  it "has a HYPRIOT_DEVICE= entry" do
    expect(stdout).to contain('^HYPRIOT_DEVICE=')
  end
  it "has a HYPRIOT_IMAGE_VERSION= entry" do
    expect(stdout).to contain('^HYPRIOT_IMAGE_VERSION=')
  end

  it "is for architecure 'HYPRIOT_OS=\"HypriotOS/arm64\"'" do
    expect(stdout).to contain('HYPRIOT_OS="HypriotOS/arm64"')
  end

  it "is for device 'HYPRIOT_DEVICE=\"ODROID C2\"'" do
    expect(stdout).to contain('HYPRIOT_DEVICE="ODROID C2')
  end

  it "uses os-rootfs version 'HYPRIOT_OS_VERSION=\"v1.0.0\"'" do
    expect(stdout).to contain('^HYPRIOT_OS_VERSION="v1.0.0"$')
  end

  if ENV.fetch('TRAVIS_TAG','') != ''
    it "is not dirty" do
      expect(stdout).not_to contain('dirty')
    end
  end

end
