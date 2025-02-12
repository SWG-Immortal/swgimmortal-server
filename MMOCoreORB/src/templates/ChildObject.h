/*
 * ChildObject.h
 *
 *  Created on: 28/07/2010
 *      Author: victor
 */

#pragma once

#include "engine/util/u3d/Quaternion.h"
#include "engine/lua/LuaObject.h"

class ChildObject : public Object {
protected:
	Vector3 position;
	Quaternion direction;
	String templateFile;
	int cellid;
	int containmentType;
	int componentSlot;

public:
	ChildObject() {
		cellid = 0;
		containmentType = 0;
		componentSlot = -2;
	}

	ChildObject(const Vector3 pos, const Quaternion& dir, const String& templateF, int cellID, int contType, int shipCompSlot) {
		position = pos;
		direction = dir;
		templateFile = templateF;
		cellid = cellID;
		containmentType = contType;
		componentSlot = shipCompSlot;
	}

	ChildObject(const ChildObject& obj) : Object() {
		position = obj.position;
		direction = obj.direction;
		templateFile = obj.templateFile;
		cellid = obj.cellid;
		containmentType = obj.containmentType;
		componentSlot = obj.componentSlot;
	}

	ChildObject& operator=(const ChildObject& obj) {
		if (this == &obj) {
			return *this;
		}

		position = obj.position;
		direction = obj.direction;
		templateFile = obj.templateFile;
		cellid = obj.cellid;
		containmentType = obj.containmentType;
		componentSlot = obj.componentSlot;

		return *this;
	}

	void parseFromLua(LuaObject* luaObject) {
		templateFile = luaObject->getStringField("templateFile");
		position.setX(luaObject->getFloatField("x"));
		position.setZ(luaObject->getFloatField("z"));
		position.setY(luaObject->getFloatField("y"));

		direction.set(luaObject->getFloatField("ow"), luaObject->getFloatField("ox"), luaObject->getFloatField("oy"), luaObject->getFloatField("oz"));

		cellid = luaObject->getIntField("cellid");

		containmentType = luaObject->getIntField("containmentType");

		componentSlot = (int)luaObject->getFloatField("componentSlot", -2.f);
	}

	inline void setPosition(float x, float z, float y) {
		position.set(x, z, y);
	}

	inline void setDirection(float fw, float fx, float fy, float fz) {
		direction.set(fw, fx, fy, fz);
	}

	inline void setCellId(int id) {
		cellid = id;
	}

	inline void setContainmentType(int containment) {
		containmentType = containment;
	}

	inline void setTemplateFile(const String& file) {
		templateFile = file;
	}

	inline const Vector3& getPosition() const {
		return position;
	}

	inline const Quaternion& getDirection() const {
		return direction;
	}

	inline const String& getTemplateFile() const {
		return templateFile;
	}

	inline int getCellId() const {
		return cellid;
	}

	inline int getContainmentType() const {
		return containmentType;
	}

	inline int getComponentSlot() const {
		return componentSlot;
	}
};

